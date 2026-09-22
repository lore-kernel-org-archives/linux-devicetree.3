Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB10551AFC7
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790111285; cv=none; b=J90kjXhxv8wH2ePR6WszcZmInZZdRaRTldwoi66/ll8st5vF25IE+as/X4IgfcLFDRSNO9x3M0i6S/S/6ZBxgFsnk6rKXGW/fb93RO9gpMu4b1Xhk7BkZBs68n6YfbsVoAxs4IqlRakkh3pCnEv6ZyOGwlVhemLzQxwGcekK8Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790111285; c=relaxed/simple;
	bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H1SgYIeaV1yMZt1UNTBvJH1Y1m2czuc51FbHo3ARkIGaSldA2jH8igIwGkcQl5327ljfPlgDDUumKtuyXft16d+QiIDGuPqQlXZgsq36/L/tNhbIvn8dxJ6UjjkheSPgNTpwIxhCQ+NwMt2b2GwCGsax7aGTk4wlvk0OhO3cjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPUvC4me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4eU6W43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPUvC4me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4eU6W43"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MIXNOv268290
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=; b=CPUvC4meGUur+uy5
	tVoNel582JDy4Gdf18KfGaVOF9Mf2KpUymaV0li2Jv6U6eZs3w8t8zRaSHTPHiwP
	YtvhAtlWJldkwPesbl0ZD8UP2i7Fr1DCMTk3sGZf2RpAOrdy/bfLuIdZe3VuIQyY
	LqLiCmdAlwjx3xwxa+8djXBu717yVNYybc8UfQ0T4E0PDcafhpqSaAgSJaXIhC9/
	ozOKgKXtdZcpsXmlBIOiqwDQACB59kZxHyOqBNZX87uryn0xn65rYVbx55k3/uc5
	S97PAFLEwnPyEb5d0hC8FIFeXkQfkh8ahQLQOsTImLCVTiUgsBlPMlO9DVYclwr1
	4D84og==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c0s6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 21:07:54 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1416f32fe11so510779c88.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790111268; x=1790716068; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=i4eU6W43uUcDbMsGoics8l/jV0XB/WX9FMBcJmV8I9mPRnSDKrltnHcMK/3ahbwqtt
         SDajRxiZ9YzXMDTosmoizBTtqR0uhe6lbhAZU6h4qoqCeSqUleV3WsaZ4Xy5IYjN2K7k
         4dTpwfkFw3B1eJalGkr8jaCkLJyXN+B4oZnxD6FYiDAO4nDPpy6D61Bd56dBk/eh5sVC
         LsuKqcfbjNzRYdxHJZ0oqomznKCoiLXlRZp3dn/PRdK1SqDRAqCxvPDV+oaNSqFM2uYH
         3o4AJobW+N6O9QRQh1yd6sUi94yP9z3nz694KOahj3IdtDGiUgVmg1VYmegpBVcgxAvb
         DYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790111268; x=1790716068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IGuHISyj+a79YHgjzH8qsmYMqpdsZs9kFQ4ZI3iLzc8=;
        b=FBW7MinRQ1WNMBjg15tzw/Iy1jeuQ/IgO+9qHVu5CVHAXjAiz9CbDZfr/I4+hBh0MK
         Hv5NnNhe4fHiugOXuHgDei1SwjEYZ27itcUO8pjN/gGiKyNC8afOTwhTuIIdI45kid5T
         wSWGnwNnmxlNDJucn0wkFhsq/5jYHGj/BtSIQbjHwqD2LUF/0/5nfEWT4P58O/o7qIuA
         hNcEkLsyEaBLJOyaS3FUfjiGDauaalC6GZsihV1fqxy9xM92jicpJSxUzjf+cZfX0us+
         3FBvPdk8GPPezo10gOG632fMhl7MbQTG6YLa717Q+nt6vIzXAg1kc67gJaZR/0Xp7rXZ
         k4eA==
X-Forwarded-Encrypted: i=1; AKwUvBylFQZAn4hPrUMU1VlR6emdsOMVr+SbywUWq1oigHiMlurE8+0LxdOPV7XexNvy/12ZhWtOsGp8UHM3@vger.kernel.org
X-Gm-Message-State: AFuF++moC38PPVT0D5fyhD6IUbEGcOnHv4p0XWziMv6SknjiHQgSXoqZ
	D4Cze/C8zBW2wtU8oGiNGKEbpESJ4bXhr9ubtVBCKgvhogpuGVRY5MUllbSRBJkv+tLTtOVvznZ
	5JvTXMgN35hKrP0MFhnfJ6p0uarN4wCN2T5JFZrWQDKVPh5moDoR5y2d1nqWIA4R7
X-Gm-Gg: AYBFou2L8phJp1CmseEyCyv6wxMAxWRTCSjT4rrv49PIi/6MhBJF9e//KH6b+6fopQV
	jeJv0x1b5XeFKd02+hJxtMjyVanTdPII5HbCI551/Pi4rGCyQGqyVsAUoeFM8ru78oVfSnS1Hgn
	5rluxiZt8Vz6XBia48ZHuXREPTZOqaBGdP12zRxTzCL5fm80fbyoojGKuwuOyQLwfyPZaISsgyg
	Zo536mEXTbodwGycBLVs0MawTy0M4pfxcWBUez0Mf7GBDEfEdQGkiLyM3iLZdo/0hDMthlP1OVS
	9c65jA0JPNnPc0ZKHRTjEuxkyIKT+85dEK/OaUGGGjh/HsqEgqByTiyOfs+ZLh57JDZE6AIBXCh
	ljT5xvHT6q/cIZdo6x/awbat0dw==
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692608c88.10.1790111267817;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
X-Received: by 2002:a05:701b:4208:20b0:141:4a06:ad64 with SMTP id a92af1059eb24-144f90bb165mr692570c88.10.1790111267108;
        Tue, 22 Sep 2026 14:07:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm1157207c88.13.2026.09.22.14.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:07:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:37:33 +0530
Subject: [PATCH 2/2] soc: qcom: socinfo: Add SM8975 SoC ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-socinfo-v1-2-f0d1aaee9323@oss.qualcomm.com>
References: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-socinfo-v1-0-f0d1aaee9323@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790111254; l=674;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=CCkVQQ02A+XZd8aWHExIUK3cAu/PF8VsO3Lst1ch1wo=;
 b=lfS0tsTbqzXwgmy7dSrn/cs+dxnymFhBN8mJbWxRC4NzBJZfizJik1igG2m34OdhNdoqAuVOr
 96PSl2C9Wy8Axs+sI4/q8kkPxY8jd5BsOpqjE7CZDdsQslHjlfC+Q7T
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: 8EcemvzEa5Rb7AFGQwZFNDUrri2Tj2p-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX8VHqgzGLS/6v
 fD3GYatPSnDGL447Gl675T/xsjJoylP942oRbXn6kS5vC8IJa3wOvEFBJxuTHuTk/jHahQWMkEh
 dRgg5m8YNByu6fGrrzA+RIgtqxQG3kY=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab2ee2a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=c7wgbAQBttT_6Fm1Qd4A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 8EcemvzEa5Rb7AFGQwZFNDUrri2Tj2p-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NyBTYWx0ZWRfX2eSU2k3nnQFZ
 uYhm1KWvqT2HPBdFWpXzQhNG4w48CpssXcYN+85QYJTjNm5q3S9e42vzeqhBK+mB6TtH9f1Gcxf
 dzySB4iFKxLGNxXR+a04G+/w/uY6mVeN6TIIFTCtYuJ2Ka7Jvkdoqu8JrPMyi2/UowGntSCTpvk
 3oUTbsdg7CFSWtqJQdTussCQs2fXNDtU79RUC5vzAnIfoTsU84BxtlIUnAi+pfa/Z+VXYip4PVc
 0P5E3jmRoefMwjBoTbKtPUsyEkr9qJWrSljZ6KBoZgNtPbexz5CcmBnDVIzwHy8XzFGbaZJEzmm
 1OfXYQ73i3+PPZ6wCiVKmPTyROdG+tffgOv7PjDdhxUqjdIzgPk1os0Pm6n5jQl06AfrKMC921E
 bFu7dMwgw+LW8zRuGRSdkhumPUci97PLvgbu9BwSwIQ9hD5zm0P7RjWL4Sce5ttZUWoXl3xOd2P
 kcP1cnz2PHgXfGlg30w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220297

Add SoC ID for Qualcomm SM8975 which represents the Hawi platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 63ee5cd561a2..ddc717382797 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -542,6 +542,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(QCS9075) },
 	{ qcom_board_id(QCS615) },
 	{ qcom_board_id(SA8797P) },
+	{ qcom_board_id(SM8975) },
 	{ qcom_board_id(CQ7790M) },
 	{ qcom_board_id(CQ7790S) },
 	{ qcom_board_id(CQ2390M) },

-- 
2.55.0

