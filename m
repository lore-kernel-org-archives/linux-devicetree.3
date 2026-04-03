Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AD3BD22C
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775222908; cv=none; b=KqSkNKFR4ryRp3bspdLCMZC0td3Meyt1QdsuVuePdyMyq/AdETFaJsOR0Uw3nhPbibEnIhpcspXRtOfYtLb7hv503R2hs7Ly4oOJrv8uTjMDkcZFjfLL+p1WOtymoV2Bsh9P314ub5MaJ6fArztkFuPWmI89QoLnbh5CG4FjPDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775222908; c=relaxed/simple;
	bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIgEn2POhx7eGqu3StlpXn41YB6wXK59E9H3W4zjtG7GWat5859QQOZMFYZ4KOysNh5zhkMaVyX8c7NzORsN6lNHfj1me8onTrfbsiLFs8nbIImPA4ZbZY8fFoMeh8N72iO/fRqig8YFR7jfqHG/+8uFCWtaJIKNscnJOG6ppL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTYXZm8V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guUfixuc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTYXZm8V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guUfixuc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633CCt6t823409
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=; b=JTYXZm8VlV9xTZSb
	WieYYQPa4WXIOQ9pjQzncDBSOKJzZtRb022tnc9VRZssAqqotrIomwvqivT4s2Bs
	e6mr/NSpbAFa//fjqRZBTWzWFXRb0M6qtC+4EC/YnqL+NlKG7GyKP5kfJugtmwEU
	aenO78KYtXBSfyx4MF+wJbLtQPPCt8XElp5ZVjVm14N8mIe62i43Bdu3PIBMVqTT
	3T/pwNY/egoK1E5D4zHMGv7TNdy5fhTNpSJ7R7+CN3bHBDknpZtYY4EfDjdOmJLM
	/VV462n6VfHSilS5yFvINfKrU1iSfIVk5Alxpvt3g46PPZxwH7+MnLnTyhNN3jNN
	db5PWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4da6739gh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 13:28:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5aa81907so35897961cf.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775222906; x=1775827706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=guUfixuc3Y8S3lQfVlbv3QRimskPB1VJY0Py99g19Q6uBK62XEMKCgS5otfaQg/pCz
         QXlGgKN7AxWuCBGK9hGRvKtbxcCBK+EZQsEUwr9h36SN7Vf8nrdsTHu121nI7KUX20G7
         WL7xYLr7+tL+sYpgrIoW/fgQvGSeXps94KTBEq7EAYe9OGuFJEoht2jp5d5TK8eZmlaA
         X11iP1h093XAoF5/3Hqjc77XT/ccZ2/BFVb4YMY1fAgZHpCQVGwlkzmYfspk13RF/8x/
         cmxmfRoWccfDhkWGEo8gAVRVXD78eFG3O2fclMX38flRv2zoTmIStX2AyYlP1+kne7As
         IoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775222906; x=1775827706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fw80Hbh3VtfTR9eV3Pf32pr8cVc2N+3UB4uAwYqoUaU=;
        b=lFT9BWpyyexTEOhPoDIQeEdGHpyssqvADHIBT6Xln77h39sgA1ci6vLMfQHfObAxqz
         7IxiadtcnKjkdJyk773Iv/Ve+iLHgd9EH/GddIy3WEt9hpjVFO5fResedz5m14LEReoF
         YnUnH0aXeht2Gpcb8JInXrzzeCAk663/sNjdeECl1aJXuxaHwQkoFPic4MO6MmxDCjEK
         wyvOgfSTLtGGXncx7WNQMcU5uSFolR0GceZSNhEW37zjlgztbwh0nXULnDhgzD3Yts5z
         MAF/qczOlGayMMT1aE1OzjUL4ZmD3vvRiQdrzdjymZNLyM8cmXsn3rGvgj3GepnKeFnS
         iQuA==
X-Forwarded-Encrypted: i=1; AJvYcCVTiQxv9uT6WAVnNQcaDrF8SlAXJ32Xw3EQWlVS8eEDGZsu5R8WdACgnNhejt+7xZYp4qCOfFNpP/xz@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXpMvUpCNU0PYSgHt2xCW+09B5/C2vssdeYpqAjbF0HZUWl7o
	CbbOkO5B4/g0/qSMjiSh+HXU/i/73IvKVKpcC1MoSPKRbDSTFOJ6/WyHXSacaw/T+XiLoChPtUY
	7c+zIGWGOyIfJeD1nnb+Dao/lJ1vL4oVSZlB4zoTvXs5ETIBPjW06zQZqZgC6twVr
X-Gm-Gg: ATEYQzyKEGZPjUJTvLcdulg5FuwTtnNtY217X1iCRiuLxa8ryLMNHjiWLdr/d5JK0Ds
	aw6ZyAIpxP6L7+Lf88LDQ+A9WJ3awca2wtlzOZx6Cqzej0y5QTXdodLs/ew31lP9EQhtxm4LGJm
	UW85z/eUUt5p3JkshhRFMFSUZSCKxm9acUf8bS3PrpTaIIJnclVTwNh2JvpT/RRCkm9B4YoYNLQ
	Mbi2iScyobeyek/R8zXNNHwf8MKd+4oGLXxH2EAiYAPQYdb3lIYppVoHfgv3jY75ojnsqkM8OsY
	cX9Ku1g51c59d1R7EwIxvSdtar/imeenrfGi9eZ4BRJcJjK054CkQDsmyZ7q1G+R2pjcgqlBIhC
	BZR4dFV0i6VpMKsF67svIMgq3bgg/Mx7HfLh5WUo+n4S/MWgWs6P3
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34037911cf.46.1775222900751;
        Fri, 03 Apr 2026 06:28:20 -0700 (PDT)
X-Received: by 2002:a05:622a:7b0d:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50d62ade51emr34034531cf.46.1775222895524;
        Fri, 03 Apr 2026 06:28:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488980e312csm22224685e9.7.2026.04.03.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:28:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:27:57 +0200
Subject: [PATCH 3/3] arm64: defconfig: enable the Qualcomm Nord TLMM driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-nord-tlmm-v1-3-4864f400c700@oss.qualcomm.com>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
In-Reply-To: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3FqArm6ducrKvDNSSWuM9bYoDvaA2/NRgRn2UlLkR04=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8BmDuIUv38Cns22bL23TDOblBcacfNXQSckj
 dqmMKbq4BGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/AZgAKCRAFnS7L/zaE
 wxOyD/9G/LHLAEtZs3ibuVDoBSdnT9XkYYPrYW4IeEO/z2Nia8G/dznLrRzV1uFgEa8XS+1kvch
 pIwz7ha/n8qc2CK3NiV8zShLOOz3zvdNOII8KxJ5ORea9jK2jRF/YTh3gluG7So44iu8fosSShX
 +q4v6bTAY0NyHhM4yBbFdSJlz24nCPeDj/W818LUk5dvsG7mBPqEs7xy/GiNz6LcCqXF2z++i77
 18+14TTO5mM8ZK5gJyHfyPKhkoEd321lyQpZQ8xyTr/YXamtQQKlPlyfN7fucWDEoQsGZrCjbPg
 QS/3rFyGpvzhynv/N2dWQdayWbdRwcGKIk4t+HWEi6Taagy5PtQvLLLBY9uFoFr9+sR5IFjEnI7
 +MryWrAKeQtS0A32f1LG4ZgG51djJEVaCkX/6StdRLWTKsbu//2rf2pNvlfL1wqZMYypYtCWW0U
 BZJv4C0enapywhUxcsQuNM997aDvxyoSE+mCN3smfS66u3kryCr1F66HQFmVb7dEJ/pHnhJt8GS
 WtT3NDsQtbJv7/M7QpAatvnVQSvL4U3N49PxcnwCZHB8dI0oz41aDe6B3WbcsDZ4TlWlR/ACYMQ
 87JVZwVoh7Afk/rM2QzkL29Y8K+4l1z0lLvljQyue55xMbW8iSEg8rz43tkasFMRsv4bZiZt6da
 3iYak9iwthM25Bw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=erjSD4pX c=1 sm=1 tr=0 ts=69cfc07a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=_9xgnikUNuCcFz_Jzt0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 14vvFC-2H3_6CKxGb5p44g9N_XTnOBeH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMCBTYWx0ZWRfX2dblvGEPw1LG
 RfWumEqYs3Tc6dQzuPBf8Cr2oTse2Sm5ZdZgT0qcK0QRNHg3FtWsfZ2ASqL/0Ynbs0gvg8fgZ6m
 Hi8xcmanxyp/8L/7lLdExsg3KnbO4zZ+sSSzo7io88dXRzvf4u5Z1nR1FGYcbNAEBzeCdmZzXEs
 6Nu9bVWkWFo84Apmrn/wUPuAT6HgY1fE1BFzjTnOPja8GgddJjRXI1rJwO1lgJ2sM5TiNOigYgW
 QyrRLX/6QeHxABa8l8LXArTTSlusc2UdsRZH5pXja5NBCXkMP952KqNTaa7EDqMph4GTQMDChGr
 IN4S8zcs0BHtlGWv+GYRp90Lp+3PqhNT7eMsXpEcldS5SFMLFrnXKjHm2+sS3u+6d3xeNYU+Av7
 FvJzd12nfym9dUg3MrWJrVAnxN0N6B+/Y89khhMwsaRc7ULeNLk5ewyGxPqWKWef8UBM7ItHtiX
 T3aO0heFhWPl18Fv1zw==
X-Proofpoint-GUID: 14vvFC-2H3_6CKxGb5p44g9N_XTnOBeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030120

This is required to boot linux on the Nord platforms from Qualcomm.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 163b7f0314c90fc45eb6c4aa5e8faa549c60fdf7..31f8cd7cde6fcc8c8da8e69950dd4976ae04cfc4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -675,6 +675,7 @@ CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
+CONFIG_PINCTRL_NORD=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
 CONFIG_PINCTRL_SC8180X=y

-- 
2.47.3

