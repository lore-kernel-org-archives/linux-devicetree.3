Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBC547D444
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327402; cv=none; b=BIe5hn37QQLiDCJyBKspf05i9FVfJ+jn5A2vUvSUCpnSwGCcqrYLsF18nWgrlBb04BWYQ74ZLvfxd/4B9b71Ze2qFhT1MxwF75PUbseR3NOAAVyzbMb072AlN4sXIawIbVDpVwnLcTVYA6KgwMptcsuKPZzGjFNmQPImD8OAMHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327402; c=relaxed/simple;
	bh=H3FZ7znaCS6E2tCa+3jHj85kDw9yZ0pmbfqMcQI6JqA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WGSFbnMjXfDXzyaTgUNadljhxtxPTqvx9l30TcwRelBpU9BDGHkEogu6trGY1MWnAadlsZ0f+BHyHXBG9DvYVHpCb61c40ZSF+Jt7xRZQStllhbKxBNPYP7cAr0QdkikgjpQue0KZzsOQ69fYpFqQrRvKGsQys+RRdTcjgFauvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvCfmozJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AhvRiYrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvCfmozJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AhvRiYrT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXNP289464
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=; b=IvCfmozJ6Tw88OYG
	BQftPtdyHnoCJIoCSWojfqPs3/I8gxD/0hGPQIT4LuU8U61KiKfUWNFjZjt4trhu
	CJrIPCjCpjFVmvi261T3d1cyw6cEIbFaICH6lRuw0tlhPt0m0JXRw1Iefo/otIPS
	RWX6N8dbyJ1MGnhuWlY2EDFBb8izgok5qdU/p84Zy1TWp1d4EnW89KLCR02EuLGx
	t8Mej/ANUlLDMwfc9w8y3w2ls31dh0xykVB9aIakGe58dRZk/N0gOJBQykkwynVm
	B8kXPAcHAO6i6lS4C6qsra/nKpkz3GQ5KBj9GQqgSdBgoY87P9AFESDeHXyl/fwy
	CkSzYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tus2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 09:09:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a183a0e93so139236585a.1
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327398; x=1790932198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=AhvRiYrTn4VPsMthPWcebWBXXIXWFUvYxZUX4uX6gcIQLkh5ZeGkoemWW8F/7N12r6
         uhiR1ZjPV38+dj9qE+AhWgZUS79yF7KX07AGP4f41XW90JhBxzhFHkk+xe3rC8kcy/ov
         S1L8ieXtIKFKU8LztCLHCv3n3tsLUxEYKroTeZ458Y34YbpRQA7O5i68izMt1Jzl3Uvi
         3xCymafp4lH21Dx25cXi/fmtqtDUh67WnAQeHdvDEN2VoxfmBUQVmGS+NIblOku1hyzP
         zD1ats2SN+UDVCs+4veWB1cWJsGgvpyKApKZ696K3rSkLHl+eK7xkMarwtWRCnQg4UwT
         AEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327398; x=1790932198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PagDSuh7l2ZhcYiXNCHSTvc79NuxyK2nfl6x2BVYD44=;
        b=UlVff2DrSmtqM37VL1Hlnpux2z304smUYzjfPi1RLz+bNNUlr62+IbWbBx6xemG1kX
         wqVPMcs5quBN/Fvn4NwVP4hRHXVOti/YrL2AD/sjTneZv7yK1HGcEFFq8r3JXNKfC7fo
         8+HhoSIdEmUJpAJyIw1QLQjBzikffh/VVWuyGYX5gJyW2CoBYa00REHdDRngcbrg1IN0
         /+QUlq+yjlWdOH9wHm7yQLvqxWp/CFnGV8bzWNM8WkELMlvtxQWO/CHFmI3pS88D9ok2
         uDD2W8fB+Hq6QRGe6Er/Wnz5p77erCOkDb4cdL+nBtedeRf1LKt5kg0KRQ79h9VOcYV/
         Z58Q==
X-Forwarded-Encrypted: i=1; AKwUvBypMcS+Wgd0F0t032NXYm8yR27gxquKIkYOpNyT0UEE/dP7FzQY5Ep8AtLnfsijqUzwyRCOxjlBLrdV@vger.kernel.org
X-Gm-Message-State: AFuF++m4kkWhrKzPmWIkA1KDmAuwyjHfJNgEy1KVLBBxWu0BcOm5BSN7
	raBr7NqTmFV1dwhjmfq5SGemCBdoHF/S6ufl29iWn1sPV6Iiyq2TVHQWx+KM2Lfjmxt/56HGpyC
	16ZCkbcOO0iSOIiqzVefpCAHA5eAa4aR9iz2afoDPdoO6gfAmeDt2ZFURhcjyczwv
X-Gm-Gg: AYBFou07wfwRRuFnNBM4rVhJY7cxgBucYTjRS2Mt2SFM6FTjvwwrtHMSchVwyz/mMLP
	zrXf+NGZBZJmuhHqmhHMqBTon83J9TN6gGaHD5vnHfbnce45thij2fTzqAJOJJm6mn6ANHiAHzU
	dsxCKAAXJovDMiublcqrDF2u5+8DsA6tRf1OdjB6LBGhb8+8082veGcifpaORl4ern8mHzdvpLS
	gyEQqBqNI2P0dIakobD0V5Oe0fBiAkT6QNO4glVc93uCBvbawSzED5lS4IXXbmgigMMrQ6wbFYW
	kqr6hkNn3gSPTczDUrw2Gc5+4i6asa+VICckjsmaA1Dr/JZHYZ7lxRmORD6gekfLgegZYgjoSbs
	SPEBP0PcDUh+nOWpzrHal3K+GT6QJtZ9aRLdusC9dCm2droO5OKZk4+O41PfZqBqcjGOHO356TZ
	MZzJyCaxT7eCabXx08pFNVfgPjPD4Zbr9L4uHjpWMDqz/q3Hhe9Ow=
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c43d77939mr320251285a.62.1790327397619;
        Fri, 25 Sep 2026 02:09:57 -0700 (PDT)
X-Received: by 2002:a05:620a:471f:b0:93b:d7a3:45d5 with SMTP id af79cd13be357-93c43d77939mr320248985a.62.1790327397175;
        Fri, 25 Sep 2026 02:09:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:09:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:50 +0200
Subject: [PATCH v10 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-3-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab63a66 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=yPTVd8cUMD2GasGf7IAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXwoDdEs3i0u5K
 Ng6h/AV6uDZxhwlO/Ar5rfJDW1/jXA+rrZcvkyz/BGcDTPw+Rf5s/GUD3jseFfUhAKM8JZe1/8c
 SZXdbWSfHzFsWNgHembmpimyyiWAveq71XmJ9ILEmAKfDa453RPRL8yfQAdcXOBq7T4+kVSX5Xv
 40KJCl+dd9AGOClMGbH407CoF2d9INuwElHs9fQvHJINlv7qL8qy8I1J+vGIyaoxBjWlA9HQaHi
 +FQHjhXAOa6cQ5+DLP6E+ZDPf4PrUKwtALBcADAh3u5F7QWLCrMfEBMWt0hUHNAtmYuz/t1dHRb
 BxtqLnrMZhyjnpHqgbJxGnwc7tgjHgoDNep+O7CwJwRWrixHmVhFvOFA/g84ISx7R/3iD/kSmtN
 5ifNfgK5zIRFSvASPhtH7lO3ptyPPsWYsKF5KrTE/ISbGmNFwCUXEPO2GUEXfhWAFgqhL7bnNIs
 ndeuTcqGIMAPCbH4PQg==
X-Proofpoint-ORIG-GUID: YyW1xf4R_M7jopB3jWQivzF6c6pNmq1X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX2h76m1KNreo4
 wXpYS7Vnbf/Znouu/l8u+AjeVAGAo0HPzhlkJuhj8MtUPPQsybL3kk7jCtsiSAZGLfagTzVzk2G
 AOgJTupXFvVF70lzJldGalVNAtb9h8I=
X-Proofpoint-GUID: YyW1xf4R_M7jopB3jWQivzF6c6pNmq1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc41749e60d772ef4 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,7 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
 
   reg:
     maxItems: 6

-- 
2.34.1

