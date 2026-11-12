Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484842;
	b=i4z3DLfF13BRC7bj1qNW2Coxh8khzm9hIxHhLUxFigE7/Ac+tcPYZ7PpC5vipvt55D6a
	 WYpizjiDWyRidKz83E/8YMeiVysIAPJm5jWHpoyNI9HiJ+dbIFDEbgrq3Qx+fZeVJn6q6
	 RQvuhzR9lrTBkl5KjxL4Py1JCJQMfsG+KBTOokuetAtS3EJBDN9ic6IE2yR+0z0It8N5/
	 pT8UT/GJl4ut4pkC7OD1yWrr2UBhdFrBUR2tm3f0luCPigbqjyVfUW7IL/cDLYgFA8lVC
	 2V42YLKIiD8V9xC3wg4Paib2Wfltua2/9K//JHCCenFMgqCAUg7qE7AAdGhsNNVwkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
	b=daZ/wt+7UBgfr7G2ADUkFKrIbJu4kzfR+5Ptq7j5XWHcdsc4dQfsMZZ0IOy+3SIAMgU3
	 tQwFHUSH+dbGPQKmG/izS9JpxiPC+GKd2eSvh6zzCY7a0XVoD5Fh7idvFTDJ15+vc83Qu
	 MgE4YK8Fc32OA2yYEkYsjSLMUYpEhcXn0ep7m+LMdNAQzvUQZin99IjHqYHyXJ2k82JQy
	 8KH0BCyatIpGpLkoXVjTv5uA55TvytaDpe8Z9KSEomajfnt/IiYcvqzH1HgKA83iQL5d1
	 3K42QqvQpkM6Ne/h2S9DoOq/K8/afRKoowVKI9jm5vWPtPKoU4C4lUxyP+nWgWaU9GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F94606A896
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F94606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw2NHAls;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJqZu9r6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB4cr53893148
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Ir4bcmZQPxD
	iDN8eVbAoOquK5iknnaDWcLFSx2kItTg=; b=kw2NHAlstCoLUs53DnzXQVPvSnh
	CdQPJRduh1AC3WIKI7S+VPD06JgicADKxe37p2dzKejFIDME1RbSfsnN7ACfs4Va
	dz+wQ9DVzxOsFLpNL4JN4tHCTLIURkep/2Gztiz97PFYn6QCfHLk0xWYHOiRjyfA
	Z3bbV9KZ8IjZKojHlPdlYBJOStYn2mc1GUmTPQw/VBsB+DNWdq+xaJv/WEOibQoh
	MAjkUN3RSLIe4oFQDEYwsEs1yKX9qIoi/Z+teAKStE+RARphjqT66/2xSqF6bCPw
	Fr4ZzK7ddnyWBPlowcrEAerv63CYMFJ/3We3GtvgkRcjnCyUhVaL463uk7Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1fbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 12:00:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so953633285a.3
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484840; x=1795089640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=TJqZu9r62yzm4lBq0iPmGILz01RypeCvNnYbaLBeqLFK/52ltiv1hWN887MzY1Ba7p
         oOdYgXTjb35X+4JP7p6Bx5Z3CDc/QMsSA5iqXm6GZnKrPWwYAABks10nqLyoNAcwgO06
         KThkyj39JvPIds8giY/d51NvCphTg2z3NI2qyFCn2S+f747UaXPlb02Ar2QWeEBXUBNQ
         vqXndRgMaLIcCjgQMKY+Fts9Tv2+vu0+g0fYckL5ojHV+IZ67kyHKyjrHd5aqj+0Cvar
         p57RVq0cdGaYkrU5p0B5w2AVIabTIMJEKVwQlwMTKJzz4vzLmH5umYwYnm5vyzEN/lnz
         UGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484840; x=1795089640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ir4bcmZQPxDiDN8eVbAoOquK5iknnaDWcLFSx2kItTg=;
        b=xItMyiZ2yYXM26Xy2F8mPJzAx7/5g2nOnePwZv7IAPWJDITFDJ2RfUH1Ll7+IDlXLv
         8w8Oq8JASSYa59CR5P3OUiVs8a9G/vw5fvjIywaInkqWYylbCtqnejgNcm6GtMuS4m+M
         ZGALVmOadrH2eOQRqHbBDnAnzBB4rqzYEoLehgv3sepQlnemT2JhsDgb+kQ1SI61p1WK
         cHP6JyNhrgIe0Vi0kG1e20t9UbGSBxnLH0lb/GDr6lOvfgP4XF9snVCUF6570tEVHKha
         XX4WOtjFTw0rvmZwDR33TXl+Od93KO149cuoRcFCyjF8aYW7HnsYoTvYPXX1LqYC6BpA
         K7dQ==
X-Forwarded-Encrypted: i=1; AL+hErGMCci9TcejqmQM+pDDSqOU7bR9pBmxWum6os9mjgzA6dqKRef/+e702flIBRheJCZhxhHD4t56IEpw@vger.kernel.org
X-Gm-Message-State: APuU4Z+Od77tSQ5TBG8H6Id814kUvJA5m5u/BlwMYiDtI6lDT/16SxEm
	Pl4WJdyYu2u2GHklLKbAjGz2ZF9t0599bQ/EUlddMY193qnDOE+u/2vlxq50ZfmIaBDySinXKqk
	C0XJhrLcXSQKPuCi+Oi+VXQzaHM5PDSjJX74OeyH0Z0MR8zuDx24Pb3K0FZ6Gvh43
X-Gm-Gg: AYBFou2vI6uDeS2LB2tTp3c1MCOto9NdPJVec7I+d0kqeW29wmhcD5+jLb3fxew85ia
	jMsGaSFXek4xOcz86C3sPVAWD90sSWNUsf1cVUipPpHepjsNbe3/0IccYzM48raf1ItlNoacdlw
	yVO6osU37K744I7YfOTuN6uH869I+zIGhjF8r6a1oJcoqRIIHeECROGGm0/i46W4Oewto4MNrb/
	jukPggMzyn1teL4KrOiYqaltjWKoI3sLHPABNHlJqKrtFjI6Z168pUCjKX4Ed7s8mDmmM0NU3ww
	TTOGC+ljQUVFRm0MqE/F4AiUadT/A727QoPgDJ+qywVYOblMDmAhtv5uAntPGTsiNsYG7YogjSV
	DRnxdPglXEygIU92NldsD8jRAQ/BwgVSVxiBjTwwyoi/nH0H/xoAxOWwX7QBJ5g==
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873951185a.46.1794484839881;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:458d:b0:93f:22ae:f8ff with SMTP id af79cd13be357-947b00388f9mr873944285a.46.1794484839405;
        Thu, 12 Nov 2026 04:00:39 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm16682052f8f.10.2026.11.12.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:00:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Fix missing wake-gpios in PCI
Date: Thu, 12 Nov 2026 13:00:32 +0100
Message-ID: <20261112120030.99510-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261112120030.99510-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XRwVuxCDW7jPoUec1ZcnX+Mrz7qzgQAPPCrZ/RAYEVE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9apfXDbhXQQ/RyD6WxLabDOBsbrKY5kRok9kc
 JzSJmExpaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavWqXwAKCRDBN2bmhouD
 1zxnD/9A9wsqYLVW+NlmF1ZtFAkdexSReqXpkF7A5xHItGhA5l4DOtiKGggZf0AeH8AsNGIEMkX
 kf+AlVFcYV3jprmWQJ2B8shVfFfsfhEBRimLh9RKrVQDHkPR0/EQbTTp32gzo658KavirxRAYLM
 AoUUCtsghaLsLpLWP1HQtunFWEEKSJCFVbOdKHOUsXGijuL82AQTmV0l7K6lj3snzSmZWEC0jlY
 L3gfuYUAUmco270vTtPhXpr6+hA6Dsl5CXpvGiRCFlORizB2WBguUpx67NR155WnnpmYoJMp34X
 ZTfCxghnZQFS6GKxUHSB380FvGTVR5hQ+pyfLrLlbSE7rLErfJw2t7MsMAFUx4sz8e40JBa9FsK
 taBFA74Tk9NKM3AxI5WzhBdo01lWDlu08m5gzf0OVHrDL71oeM9UISkE+pPgPR+AUR2nFwj9KUs
 k5DURpDlfCY+LvxxFgLEVSjdwZAcKSyB6AMbMTLeJryO+GOKVIiujp2RqxucNrA4/zFxfwvPKPa
 0vHNGoprO4pe2oIzS+6GswxsZXIdfERXFHXIpoCuZ2IRhJCKN5pInMfPsCO4sRhv9rFmmz9fLoO
 MdcIGkwY/EVfoHeMm/qwNpUTOLJBbaKZxQPQJ/DHARc0ZH9KC1jswsKD7CX1t9EYkELcpcmPWLe j/trJ480wGM/+sw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n_JESVp_eQ6gkAs5yugWOGQBSeCZ2Eh2
X-Proofpoint-GUID: n_JESVp_eQ6gkAs5yugWOGQBSeCZ2Eh2
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5aa68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=OK2SU7EW0iCpRKP1AM4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2NpzVZV7U9z1
 EN8loDZVDAjtQf99+E/RE+Bo6AU6Zyp6rwti8Izw04WUHwz5wzP3x/mhHaYB/hb4eLXLEg0P3V9
 JBEwZ+qhiEP6eJmUvJsfQ+PncEmdvkw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfXyYgwWo82untC
 iJiObvRUykY4ekxE8Se0LhKWcMNC19YE5sI/yeeRyFt3v5fMpNTEDw30tSzOed4WbpXcJrBXO4v
 fK9P99kM5t3GFeejufUqqVs5bz/FoWW6pE8qJKvQUQo0eN20hyjt4aLWEzqklRpGsy/m23e2uL3
 HFsvIW4CU/ngJrRq3wybCbUioXmSyUhoKUqtgYesIy+x9WTCbm3vkCh203ENpSA7hqWnEptJYq5
 5cRXkD06JUZILJVJ9ZbNAaSXiOLW2J2gXA/LqVbIKiN5WLhNYgbaJ9W/4+JPu03sVvbwuAgJcN9
 cLy0BX16yY7JnGwawFDODfiS6G28tFRn5WzhvPM7GuIWON3v/aXxcCMpQ0M7xSNYa5N9gUQWefj
 8T/urn/X1d2ZLmM7z0i9P7zkcJTPeJm2phMJRFbLBBxsrX0YbC6RA43mYzpLJWJ9brZ3iZR4wFB
 IK6U+9OGW8iWGmoN4uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120047

Qualcomm PCI bindings do not allow an "enable-gpio" property.  Linux
drivers do not use it, either.  The pin matches slot wake-gpios, though.

Fixes: a1c86c680533 ("arm64: dts: qcom: sm8150: Add PCIe nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Use wake-gpios instead
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 293fcbacff34..328e8be1638f 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,8 +2019,6 @@ pcie1: pcie@1c08000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
-
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
 
@@ -2033,6 +2031,7 @@ pcie@0 {
 
 				phys = <&pcie1_phy>;
 				reset-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+				wake-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
 
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

