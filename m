Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E3046C822
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788248443; cv=none; b=iqmL3QDeWFY12rWPmYrqBroE9fPxO619Tu6zYQBK6EZqwyKrpd7p+TluUZ9ifWDYV4ITXFaQUx5bfrFZps7YNB5vJhMKMO52hWh5Pn3VwHtjoZyGbJjXHChJlbfqMdbzNn8uV0d65kTXjbn+t8DvX7pacTtVpltLcjmIZyRm3g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788248443; c=relaxed/simple;
	bh=RhYbLOVuCVOj7lB/xe9Vh1IsoRjbmhLfW+6pU4fEYso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ILF7n8bDUA3Y9tKsxpqgjsqHE7d8aideQzKMRrFA6mUCVjyxGkLo0VAufdPqtUDFjS1k0i7S0nV5Im16D0VtKbTFBuKLwnKRZypi8eMFYgq7TsNvgkdBicipgm+SD9IoMlbETMogvNQVKpwyXlnj/ktZtwYrAKYoI8FYy5PNTwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eiaaS1Hf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGPhSLIl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eiaaS1Hf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGPhSLIl"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179M051709631
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=; b=eiaaS1Hf+5qyT4s8
	Q3h/n7e0pLj4pQJZgnSTcy6Zs6NdLE2gg7QiW7v48R2AMZAQr5zrDMb9lJ9EoO9W
	nQNIlyGJHMEDkz2Yc8OMPbX4Ezr48F1cQuETBvDAzixgRSpPyprtn426jNu8W9p6
	myA6o1bJsKjU25vZiLD47k/HjeMOPKbMNd1sFEJJpxHJ5JefE5VRJCJgye2yC9DA
	UdtgHkx6NTl+5025UH5UROGT10UUhfGUlz73YNvnH8Yu+QFSe6E+TSUsl5Vx7m3Y
	3emoZtZNhM4xXwWv1jJsoKpMvBsB7ZX9IgUf7I5AgFlIJASaVc+KSWtcOJew44Tg
	CGInIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so1107627185a.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 00:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788248440; x=1788853240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=;
        b=CGPhSLIlvHY0zQWtAi5a6KGk1X4ABbm4nY0bUokEk/QvnUVkQLba8UKUkEomm9EEEQ
         mDZ/CWOuFRU/l+3Z2LlaNnJpl+JkSAXttkZcZAyX3buPTuE+bwH/HXUpONWVUT8xx5lQ
         eyefn360ytBblyaTDZwmZLRjuCRZro6a06MynUXEU6K7zyxqI9sYtZ5pswXO33JIb9ai
         oeAHhzFXhMH/T4SKkb3IgG75A1NeuZvCc425ONJvQQqSgSKmFbq2g7v2gGoKjuTwEncr
         MGTLJ8xe0CVumOCy3WI9n/6QdqtIf5181Brr7sI29nwGraHL2tsapnBNsvsc0xGFm8NG
         oQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788248440; x=1788853240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDrmY2QxhsSRbfDjC2+TRp/S+s59Twvb0/++a3Ypvaw=;
        b=Hw8pJq/wGf8AqZzoNWGIB/ItEVCdFDgwEPdJWMQemH/RUMyEMb6pkvWusyyuMWYFcd
         wLEURd5lY+RXjLWIZj/1paJ7cJVQAAGrLcv68Ss41mM4DrmfiyiPEQGHod8rCHih9yEE
         0dIQeng4YnAxYlA5n81ZFHbNbtIRW7k92UVG7UpCeN4u6RxoFccVHr2cDYQXT5OJAa1S
         9urM1uNOwhVP/AhU4ctEwFBB7h4SZSlwkpfGhup0r3yWWWpb0TLmCRUqgPgs7E99JBY5
         Trpq5DZ24qQFasRz/qEPa3GRsStaq8DEBBSbjyQltkq3HYmO5xzwbqxlQZnIZ5a1c6e8
         DO8A==
X-Forwarded-Encrypted: i=1; AHgh+RqBDWr4i6vp05AIQn8p52ZwMqpCT3NWVecwKilz1exC2ZNeV62+RcWnoF0EmY0EOjcK8pel7614ZzUO@vger.kernel.org
X-Gm-Message-State: AFuF++kjy00RxAF+fWlKkkpVbW56/fyS1U7IhPF1udkJA+FMJEdPVQ7A
	x3qca/6dKo+Dd7WzEIHe+wp/d9j/wYdPb+t8barR9Z9X1HFu/htvuEVtWzJRmb5uuDI7ujsWj6e
	Eckd/it2rLAS4Dba/mInZRBzJx9eQPh4GrpM9Pbk8fO6Va4tLd/PI3Y6dacc5KgDbVTER/2YQPH
	c=
X-Gm-Gg: AR+sD118RNHjH5TgadvricO0eYKNP0QUQVNV6ssHkNsYy1Isu4wwGb1q59ogQ/QZRLd
	0bdoAipA1Np1rgReRN34Y3YD9ZU54CizyK6PO0RAVSD4XIZwPYEheA81YRMnYRxZeZfNIv6mXvA
	dIRftSyZ6q1J5VHgPuG60bmEc/MA8AZgvHI4CjjN3tK9Xqrdl9jWCaSt+nlpU3CT2WLONPcny7/
	ZabIkn/FVmCY6/6wYCVB6N/2TX80k/e3RWAChNjCv2hhXFLQnYNXtt+KH6cbBGV2Fw5gATu7Uha
	oYopmT4RlonKvaPDASqOzX315mTAQ7iMqa1ElKPNTNUlpxH2T1Pv53Yzc0RgNMl5fBOud0AA8UN
	D5AYdpue90Fypyg0rhRHi4JaYpXklIGuf46RPsnYOwZ5DnzwAkIP9J/ZC+FFlo5Mo0xIg
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id af79cd13be357-93913923d59mr3373546985a.30.1788248440228;
        Tue, 01 Sep 2026 00:40:40 -0700 (PDT)
X-Received: by 2002:a05:620a:46a2:b0:930:f129:1a45 with SMTP id af79cd13be357-93913923d59mr3373543685a.30.1788248439803;
        Tue, 01 Sep 2026 00:40:39 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939173f2758sm960412685a.37.2026.09.01.00.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:40:39 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:40:05 +0800
Subject: [PATCH v6 2/4] media: i2c: og0ve1b: Use monochrome-appropriate
 test pattern name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v6-2-a05b2d04c892@oss.qualcomm.com>
References: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v6-0-a05b2d04c892@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788248425; l=907;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=RhYbLOVuCVOj7lB/xe9Vh1IsoRjbmhLfW+6pU4fEYso=;
 b=qaTbVgTFvLg6O4pT5iGS0YrMcz44At9ZTuK2U2ofrrKOtcKYhfCnWjcbIV11t0hjlDkn2IGvs
 crsQIsBDLykAlvDZIHcsvtBtXK3VSBBD5Mc8imDaNLfSlwJ/JJ0Bk46
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: fsPE-hl_LregmMBHrH6lmYnXAK8uCEZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfX/qm52pkkdT3Y
 ug3nS5/xlkP3gENwpsLdzsLY92mlgFsKIVMr9g//qsA35j3Od2MLlgjBlDRIhduSofZsfJ1kOCs
 KWhE2U/CqbxVSXUrhovi+EUPL3k40pc=
X-Proofpoint-ORIG-GUID: fsPE-hl_LregmMBHrH6lmYnXAK8uCEZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NyBTYWx0ZWRfXz6ZF2aIQGV2h
 8E1ypdMgyxRrD1P0Ql+rkQu/MVvVtDTXiRXfh2FEkY19RneAEOGbEFFaYB3SqnmRgne+Gf693yG
 a1rlNOotBrQDrMNBoAxPa2G472eXonqwJYFmc2kVNaIFfmZjf0//eKQmI78J8biBCNTDYSuQ1T5
 Uzlb2C1oQqY+TBQWnyfHm+Gk57PHz+/MF69CSz5ix9M20fEPAmMuXX04uf4gVVqfLja1A0CJILE
 JwzJy27I5P/ZYqHLN4k4CBTFbfI+A1nwpTw2rr2VUfR1PwEQdo18n8jV/5t/mi5hMewzoo7onJK
 jn/Jv173T1BGwYkwVhgtJ5BDsW3tP55rpXC2umPzFTgkRtFwStq4jthbe/IgbHFz9MeKdxxr1Kq
 7M3mchVYQjU0ExU5Uo3EiItVZJxl4PYV4Zkn13tCzS0K5uJL4rvuNN1v7pwDPj8T0HQOA2aZeF6
 t2IGG0wEdaUenxgfkYg==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a968178 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_aklYIXRtum3iaRq27IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010067

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

