Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5B73F1ADA
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170708; cv=none; b=f8oW44qm6KrqMVoFt9RipdcyWJ6NLo3bh7uMkOFuNJlT/1OKPsqyeCH92QE2ZgRR6m6lxbxDQ5ca7lpXGqfA9sT/wxV+3dE+0x1uoeZaJG0XRggjkbJTrE1YCFitaf14DHn6Q6Y4BwmqCefCYe9V74+SeU5dqrFBAuV5ID5HnQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170708; c=relaxed/simple;
	bh=CSq8Pw6cDeskxcdhYLazaQqPelPLgYZUuSVgeF5b3ms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pwk2yA1FkpZ+oJZ6ipT4+yi0dHXqQ8rxm8aiBqKz46NoXXsvyCLNG5pgMIDKvUwJnyyG+xK0vjc4q1FRe+46teqJ6FhZ5+VCK3XUNR4wSvgGWui+Zeqt3qzpc35OfHgL1VDXbCm4f/tOs/lx+54HMWbeU/nhjvuq2Xf71gWb+DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihzAmbRr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw/m9W6w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihzAmbRr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw/m9W6w"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xRi54081943
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsfNQOHXoNcTxcfudLDXkrfZiiDylYxqfC/KzeKCF1w=; b=ihzAmbRrw9wEVkyg
	QKnvT2cal7AKUxACBGItzZZG0Ckudc8QaIsfNE13YtoU1AgMYfcH4Y5ohAkER3t9
	r119RBsrT8OXqt5AKMWGOGeYZr5bHi10ztAqEqW51n1pUrmLJnGHow/lco0tprJC
	XKqqnLiyF1arqGoz1pt8SIJHMOBWbAyillXZxiEw4zHphqLZ7iR7ARcia+2fMdcr
	DBdyoyxm0ll+3sPepE7vP5lswdj7fLL3A8RkYjSNiHFRWTihSvZWtJ9VYLvTgfKY
	ZlADbFWoGMwlkA0uz/aTZDnpdLoFbuAFnrvghAIZd0Pk7ljLjF9jvGJjThL0RIVP
	rBgafA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h2407-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 10:05:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so833131785a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 03:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788170705; x=1788775505; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsfNQOHXoNcTxcfudLDXkrfZiiDylYxqfC/KzeKCF1w=;
        b=Xw/m9W6wkC82IoVVsSG8MACtaZV0HgvYsAHl2i45I9vo0DlrKZtXBT9h36sfSu0qAB
         R3ST0aRmT6vB1XgjeFLJYFmUodSpBk23n63aYcE4I/s75SC8NKR/DBDXWDP/GM9nwUX4
         t5yZetebJrZleGiywwNQWKMPWEjd9ypgm71pLSMzadbtz3ODwaxXKOXBbGmvqOQTcbgl
         EjmarYKhueJrMpdKbTJt5Zwezt0AyrnwPrrcx7gl2ylbHfQcDiYNfxA2iIHvw8miv44y
         4QLpV3OTKC8ypDuP00zRBxCs6IozOqDJLVbe73RriMIfAeHyV2kFJrlhcN5Dq9pYEj5H
         ESbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170705; x=1788775505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsfNQOHXoNcTxcfudLDXkrfZiiDylYxqfC/KzeKCF1w=;
        b=ASia66C6mSSa4BSUM+AjoEhgaHq1IfGobNxz5k6hXrsQIqtzCxW0RqFHO4ltKOazQo
         +pvQs3ZEVLBPeKn7T6qAaSh1jE6P5vBWBIua+7S5ev2kislkWWw7uq6nCcdQZw4xCTVm
         4shu7XEzDgCEBQLXFfKKheZ4mtoDPAbTuiVojoW/RJG+i9hpRsOGX27v0LOpey/22RjN
         meG5TDmIXjN+ffrIdrJGUD6WQsLc8mgB53bAbYnYPEEpfobneVrEhpRXuWae443g4a5L
         VvVgd/SRjGCPCRSAhA0ldQlXUE85Xo9dnuN4IXheRAD4HthkiKnujjDMMDgPkIW4TcOY
         RO+Q==
X-Forwarded-Encrypted: i=1; AHgh+RrG/k+Rg1tH7TVblpeeI5WC/0boR9T1Q2UXn/XlKiY2dW9j1bjUCS8rPggkt8uq6VKf2sbQzNiEDi9Y@vger.kernel.org
X-Gm-Message-State: AFuF++kSxomn2TQi/P9q8jfa8gbk53d+tL59LBvPAvtMWP8sHDHfRBgC
	6+ZOpUzDHAU3H4aFpUV5euPEz/nev+4uBOIT98s0w507cX3+PapthuSXVDBb+QTBbmkSH93NF79
	JJXm2sNWHVJVTcznM0g37c2IB/5UaE702vYGa0207XEyYVdqhpNyFGExneD604V0F
X-Gm-Gg: AR+sD115eWWKWdXWdjh+Y8CeqrAJyAFckVsLFZAYvdLnDMD4w9HmgqE4AKd9ybCq+Aq
	d8QIRp4ihpa/9ooy/dUQnlFc7YtykBCGZ1IA9Od2NiY4MIKY6TA/3ybdeQlYJHiW8ebmps5Pgor
	h+yshgpPXOHOuKUusASSf1zm2+Yt2psp6SmOjV5306+a4d8HSvf4TzsnMMlHGSwjgcKwGrpSY5y
	DkK1CTJ1fS4sU6d8OCt4hzB9O6YiEthjzyokVakT80fvC3xDjAVZWdrMnZIHME4Kle5tKIDqKHd
	juBqOoLoSXGZigN+K5Sub2DAsmTEgpTj+jHRnQkkG6MdWHyrHxpVp7kDLJxmzqRf1d15fnA/peB
	mn8LvsA==
X-Received: by 2002:a05:620a:a515:b0:937:d6e8:59b0 with SMTP id af79cd13be357-939137bdf3cmr2470253585a.10.1788170704588;
        Mon, 31 Aug 2026 03:05:04 -0700 (PDT)
X-Received: by 2002:a05:620a:a515:b0:937:d6e8:59b0 with SMTP id af79cd13be357-939137bdf3cmr2470246385a.10.1788170704029;
        Mon, 31 Aug 2026 03:05:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9281772bsm131001555e9.1.2026.08.31.03.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:05:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:54:45 +0300
Subject: [PATCH 5/9] arm64: dts: qcom: honor-magicbook-art-14: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-5-5b202de8c74f@oss.qualcomm.com>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1015;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CSq8Pw6cDeskxcdhYLazaQqPelPLgYZUuSVgeF5b3ms=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqlVAE4ibzuZ7ag/SgSWaq8CiIfPZiWc3p0K4Cz
 7Mo1VCmiGCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapVQBAAKCRAbX0TJAJUV
 VszID/4i4/LwDMCxsj+Glh0/tm1AxWHrpHoEV2rq+LgFxeKYIv2fdRmdIU0GoIgb/FAEjxpeOFl
 34aXsxsjphuCNVlmo3rgO5sM9PX/OU8dzgmH7/4/3SZvwfDBOYMFZAsmj2psyJqHfHpgsnodpMJ
 9Y43pNosEENCZKS9laDXbmpQurihLGcLLFJlugRuRIsuFHmK7zJz2G17HJ034PC5r+bFHYcbwNL
 MIYi1G+PVSZVFsMK4o5MYpgnISN5v0GXIV31Gz59THIevMPRS4UYHx5EAOl/qv7ZtK2YLXhMxVD
 oyXaR1XshXdj1ShR0sNMnYL95FVBC1vsIqfpinBnRthZPNAWGtUHIrjv1ak79AD1FMMl3cBAvYM
 filEwTs1c1Yxo7e5U0DONA49MErBr47ij5TP+L2dM3jp95tHBNZLwfC61cnN8WOgQghggZB8gUq
 +UsM5laO3r44MS5uhIc/T84wEIf2OB4KuJHc4XzG8KtuKSVtkcu7jtavlxLLFmGIsCpIbBZ/Kzq
 N6qICLc76XX37jAfDW5qHEV5TxQyv30MMMjjbPuTydraJ4L5A398cD7GaH2fy3ARoaYYfhXL7no
 TEzSaFTPqNPG65vM/Q7+4cP112tN1jUiVyvwiJYP+MV9DcR0UfUUMZX9R8MA43mfwIVlmIDPAR/
 Q1HbZjMOUkhNXzw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a9551d1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kMg7jP8tXURzf_f454oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfXwI7+d5Ilvy4k
 O4RdPWBWuizZyJx1HMBaEWES9PZd1C1Vjrmzb6Sy672EAyZlPihglNJWa35qTt3oJvGE9NPH+yW
 B/24MFHPBZaEqyYNXgqwzzKQqKwTBWhx615NtGWM/NNTxxXMuBgwBbGe1UcrxTcD7/loekit/qu
 2GFw3V+AQRO3K28gy9mLlSXSquC6qWkqkXN/J/mEcH+ZcU9aYCodsTiqmXdO0n9iho/I6JhHf+b
 /Dbiu7iHpEZGBGMKJpSPDLTm8rl3RbHeHSw/aLH8RdgMjdYJWXl4o6zlCbOzgNNbI9BcnEp3FBF
 oBxHz2dePps8rHH4Wj2pAMiTeExVpUIL5B/P1Pm89XH0og0bieG3E6rkmUP64E5oVKRLyp/iIp7
 GRAqD+BGMhN7cA2Fn2tyjK4ok6x//lC915QDg3DSFkXwP0bUhTWE4XwCHs88fK893u2oRfw+98d
 +y072y1W7AMVnaURkYg==
X-Proofpoint-ORIG-GUID: JjzX2rTvpnDM_uXXpXgRjc_BI5Ndi9Pw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4NiBTYWx0ZWRfX88G7Ly+iWA/a
 bhaBwdY3MU6zRGdyiprcVNeT/0MPNOPCj0+MU/Q8MM1AycafaKkO0gmdPEDQw0jIDJ0Jxx8MxE6
 gaD1SHvV2o9a3yef7Xdei+TQ43ZRdjI=
X-Proofpoint-GUID: JjzX2rTvpnDM_uXXpXgRjc_BI5Ndi9Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310086

GPIO 65 from TLMM is used by the embedded controller as its reset line.
Reserve it to prevent Linux from requesting or reconfiguring it.

Fixes: 21b15fa5f8f4 ("arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
index b70c1e094bbf..a14f0d0632f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts
@@ -1068,7 +1068,8 @@ right_tweeter: speaker@0,1 {
 
 &tlmm {
 	gpio-reserved-ranges = <34 2>, /* Unused */
-			       <44 4>; /* SPI (TPM) */
+			       <44 4>, /* SPI (TPM) */
+			       <65 1>; /* EC reset */
 
 	tpad_default: tpad-default-state {
 		pins = "gpio3";

-- 
2.54.0

