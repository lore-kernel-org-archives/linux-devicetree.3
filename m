Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737AA40EBAE
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220539; cv=none; b=hJigAXZlmrmaENvSWYXiYLAanvuK0wq4MtP+56qKVxYOIZDoDd4Qi4PkPgtql75qct9mQec0za4kmSuN4/IIaQW4Ex/F/Pf0uaaNytqsWVrWdSe28VI8sgPHpgINxC3bEAY8Ol15NphqEabsgXPLTiEYVBraipoes0pKiTGsIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220539; c=relaxed/simple;
	bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrEyWHpDfIW6jeokMX3I/l1tUazk/tLzXXqymcsUmuKx+aRa4MfSW7DdF3OONJ3Di9UoLTZWxQjNAKUamZl2jefZVjKeLoXA0jRkwmeEIHAJE3fGxU6XPt2N3R5+nTJS3f7LZ/hdsyAYmig7L2faSn8Q52ZsbjFqLiZpFEciKVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AoXp3nqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/FRU3Bp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AoXp3nqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/FRU3Bp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8tFcB3515433
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=; b=AoXp3nqeauyXk/tm
	QjgmHjRL6CBbXEVqkeJxDFdMF07xT3qcfwpSTWl4RwbGmxW0gSvpHdJquX9uWHzp
	b2NV94oPmC/3RSbG3Ybb/tgd/Fruq+HTdH/5UTTThSGmcJNLuzCWOe8J8EQS/qGE
	sAvAjWYaM29tJ1rIKC0RtQpWXPeA6xHWHo4/QfxWzVPw8DxJtU2oiKZjsyB9ETUt
	bToGrpMUlTBbb84vfb7+ALzAiuKvX/PDAdHI97iEXL8Mh4PMKU2IxjIe2REsTrTe
	6vl7PbXi+hv4+BfD+Yu4bRAfR3eW4SBLJQQx2AJMmv7wHv2ZV0kMWDHkp054+8Sk
	UUMeag==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xgc89wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:08:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9309af14fd7so225420285a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787220526; x=1787825326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=P/FRU3BpJpJ/fqOR2hmHxhmOZNKAiTdaXQ7X1rn5gRlSlKp3+MzUNN7gQjM9JwpYCu
         d8lWCpeHgd1nt9qvnrRBBYmzA5zZvzRiH253hKxOe5gamol6DjmZdEwTrTMFOXG8pELT
         j+fHpInQXec6xkG/ChSHb/dcPthBBsd4pQElI6Myzj8jsjYxq6b7v5lpEUrEtWiupdmi
         o/MCvi6Eo82/SvdhI0DkL9lTj6+5QICveWrFfl9ahqaT4nWxXsVWMMjW2N08vT4YwJTb
         j7kz4q446WaYeOucuRXtmz24hQiyGEYAFpvJairU7c6HLNEFkixxNTpmru/A0ZyCAjH2
         6s6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787220526; x=1787825326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM/0TSrpcoDvVWBg+pgYYRSW5nyeWcLn24KBJNgdwOg=;
        b=FxVroxE6sGMxkae0rLiJpgwp9rXO5/lI5hrDpE1wXQ0JfD0/gNDKcTLgHtlVPV+kd7
         J7q0cGkeunkPwZbpZptOVGff4tkm9oGSYk0Ao8wBh2ia+iui+nDb3YdSyJ3vhiiNdzZT
         DnKP32rj2ShOeIqwq3Xs/8TslkYpgbBXCsmx4Bg2kokmjdSe3rVXhN0URZftKfXUJzD2
         puf/VQ1U2T2pdlKGMLhb2RvbSjkGvcT4d7zv1BVdcIlbqzve2fuVhdtjadHC+vel8rjQ
         tIduTs/e24t9CEQy50NnCgY7JurgINq4DLP4rSKseBASRPfSQyxuRGiKJh8+mPjBxCs6
         aYlQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIIYlA67xN1OjOJ5B9n4JFkjaORc3iSqmZ8tclkrYprpIB3677bzMXiVS8tiaFZAhwVLd/oCvJ4Ux0@vger.kernel.org
X-Gm-Message-State: AOJu0YzrNp1ZDbcLTIgWeWh5mwqQZblw9kWdNxCbU2oJjQA3ntN6NbEs
	aT6ERuO2zDoT/WnmbnWMyIvhWcbt8ApUcufaeLgfI94rjV4JVMc3yAPwURIZCtobDDV3BPDgegt
	tBXm+R5cXzgSoZSqfLQzPSjcFEd8ozh8EQinlUkmKiNcY0tZknIUgXGVBtMRZs/h3
X-Gm-Gg: AR+sD13qNvS7XBObvIBbd4xo/rmNisizC4WInCQdTreEqIKP66BD7qPVfCWKIRQkeI6
	+7uthwDtUrc+HOpc3kvrCkIFDwTBrXLN+iBDl1d2dlIE2pJw5dyCCPB73OetwBVSX07VA7eKtDW
	H2LpI0lHHqkEgGTaZEfrukE4xWeU5K6MIF75uH0zssih4gWzFDazFsJJE7A04TlsINqkjcb8dtk
	UwvR6PNc5f0egAytnZ9tdgC39unVHt04pYr44+1U3BaXif5zZrwV4KQMGpMnxrX2pU95+yiygFz
	Sx4jV2uNAT1uqSlqvzM+n174nQl1rXs2lPM/PQABld0xIgBetEvVuzVohBnBbmei0nngIslUUGZ
	ii27TwVar
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098533885a.10.1787220526003;
        Thu, 20 Aug 2026 03:08:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2810:b0:936:cae5:8b38 with SMTP id af79cd13be357-9371e25434cmr1098527385a.10.1787220525486;
        Thu, 20 Aug 2026 03:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1755b2sm134966935e9.11.2026.08.20.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:08:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 13:07:07 +0300
Subject: [PATCH v2 04/16] clk: qcom: gcc-sm8550: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-qcom-tie-cx-to-gcc-v2-4-e67ea30d8b7b@oss.qualcomm.com>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=733;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=IwT34kSLVHjVkKs39Q3jyS4BIg0aB+2aavdEaDZRWWE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhtHn8i2H/qCpb37IaOqj1SPDcl1hr2n05+Sey
 WkRz2cd1qSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaobR5wAKCRAbX0TJAJUV
 VuVmD/9bSgs7EqSALYYs/hosX+iEhJG7KmYNXev73ujJ+ozySAX4gV8En8zu6Nhh8tSfV/5qPgx
 ODva9MX7bInj6Xp/r4MkTlC+JTIdrSodyVwGzpfoSWevN2SfUvg5le87xYIW9RlBWlrJSKl4OaS
 avn3HYRalwoHu//BNPx1U5BhikUhq1ZZJr3jY7bJYTxGZ1QXFs13ev5KfSLKTa73yYMUGpG/qz6
 YH6ws1b99LqFuHxsNRaOja+4funr9xtO6CwFbCr+KW0gHRXhrHFtVT9ydRjpQgOViFhqqUDTdXx
 bmORdmRP9eB5tt1o3FT7lfIhUadEbJg/tb0wRir2G2uKA8GdZP3IoOeYtGT4LhS3ZZiVlxgtBBP
 uwffzK5LgcjHSTc0TdIahIxrVooaNg4IdGjUnQqFX38iTlUrw8QUXZMUGXNdK00IFb5WdQGxf7v
 kY9xFMD/2Jb6hN9mAgwKECRYUoGytEV2E20g98P8Kh73OpNKC0/dx6RqOYvETxsDhG6bEYAqHx9
 e+GlAJng8aS2oCYnIM6akG92z/PX9pcGr5Z40y9svawStYEnwM+Z0W5HI9BTOFs2vKJZF/BWies
 7PGWI33qfXOaH3jgPvuy5fbhJ0JOvojkTxlAfwbnH+sIZ9+C1D14xDRAbfMWIAmTCaJlbZhlbWy
 szqr2B7ULAFfZYA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=GPM41ONK c=1 sm=1 tr=0 ts=6a86d22f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: KUPGtyCV8MGrV3pNE_RlXeHVR6RxQ88-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfX9Sge20wkZg6r
 FDEPiQQq3r3wdhyiiZaCfA9yEwdxnUNsIcDu313FrJk/kitwpLNRnq9L3AZpvv4xbT7etUq9OwT
 Bl3itMpPq/zOiqvMMEB+6SIJfs279oet5GFg3WY1vxw3tmRXkjAbA9OU6sKcAorjElJjM6rNv1M
 CwdiLVwC2Qy9frza7wek8hcnR0UMnMjH7u9YTX+2pfFyztA8UtYDVeDz3Y7dRBrOkaYA94Clwxa
 cH3z1aFVEkaNJVmqQ9GiMeZmu4Wf99E9ZMQwPOT/Iaci1Xw+Oztjp0BRNg7wbY+f9HFVy5z1MEC
 Z5gojA/0k+/c7z2ZOY8X+ypSxr01WuQsiFbnsGh6nZ2rUdFdPyvjKx6V+7ZVBbLmDSgE+NbTJel
 fEgrxTr61OjBl0ddbtPNm/HSC0mZhjUlWmLkHTdklavj0H2OfIV2TqNtdmRb+hJUvdjESsty3bo
 iStliTKm+IZvnZxcliw==
X-Proofpoint-GUID: KUPGtyCV8MGrV3pNE_RlXeHVR6RxQ88-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3NCBTYWx0ZWRfXzabN7zQVLcCE
 ayOlXuMb3xLErpah2IueBS6/jJyejxIilFmxs1VjoWmIXSEFs7sbPPU0Sr5r3MPWTOZq0y8Mpfh
 xIi1OiBzWdfTfomAolo1MmdIwaLm1Rw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200074

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..427ae9cf28c1 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3326,6 +3326,7 @@ static const struct qcom_cc_desc gcc_sm8550_desc = {
 	.resets = gcc_sm8550_resets,
 	.num_resets = ARRAY_SIZE(gcc_sm8550_resets),
 	.gdscs = gcc_sm8550_gdscs,
+	.use_rpm = true,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8550_gdscs),
 };
 

-- 
2.54.0

