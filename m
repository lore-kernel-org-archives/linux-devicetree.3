Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513198;
	b=mbuUMldSJnsbFJxApo3QfUoD4QmZ3O5xNs2bDjlnEtlHykavlShYxCuf+4dVec/A33gs
	 D1mFNNqzd3nzAEIe/Wx1D1GeTkcueb72IlrDu0pc/ZCTajGFK3k7zf32qOXP+zcvVADE0
	 sPg31u8zo5pA86bomCSHGwLSnN9y6Dr1ENSb7f+0hS7o1XXWHlNCYxTDRW7T0pod47PAD
	 0aL/M6YfPrIyyfjSALCHTTVjkzCfoBSRsbqQPyhk5I0HalvyA9BNU56ddIiRbBPAAYHms
	 ieXD8gqYa4kwXHa6zUxYnn2QzpmNdLCyQS8GHNbS5KHwFRPKVbctv1KAukyQF0Sjnqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
	b=mWdyl3DHiEHrrMjbE7+t56MIxt8iXu/2GevnrqpQCH7cNH/uaJs+qswFbcpHVoBrcmjV
	 AdHn3EdFyNSIidCPWa8WJieGIF3GRQEq6fe25Ur/l9TpufA9Y6YOoZ885HeDlJVa1ZWsK
	 n00FobvMNd7l4kbkquj0prVKVNILVE1i0MZylHUoZpohttRYWffs5u/eEnJnP+0hjF5S4
	 zXKk3WWCZLB6t0OC7tW+xPvotkuaMMujxa1nh2UGJJRAXhf7ZCUzNh0ZQ5RLgDVWROdPx
	 EuVfuWdYBbO5MgclKrl5tRlMj6SWm/cmnfXofzeU3/iESjjvNPdhwuCJd5NN7hYnSSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMYUaReo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZOs4ibh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F893606A6AB
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F893606A6AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HMYUaReo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZOs4ibh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8e1on2209788
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=; b=HMYUaReo9cdZsNzQ
	8OrBLsYkEaprF00RnHQT/qGHqk1Y0sXVayAF1b0FtB03b86LLvWTT7lVDfrIdOrC
	Qe3MIeHOcXrJLBB+57fG06NFGcueSGxKbORt60ydfBSsvufEdrskcbAf944zMKO3
	GsxGEmaeAqdWNbyzXDM4Mzago6HZBrwf/aA3giSZTWOtgEE8UnRbA+AareCfdgu6
	LoLs1rksnBipB/Ov7kH1XutWtJDg/jW1q7eS9OMC23a9rrQOqociLztFtHuQll2Z
	nPvAiQyo+TzFq36gcrb+gznpoBw/T2HR+IT41Y4ED4v+HhHz3lHQRmtPaunPKQMV
	+OOVwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy120cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:39:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-89f84753b43so3224022b3a.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 01:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513193; x=1796117993; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=VZOs4ibhN3JgexrYqwmn1xriGWeEkjuSZfQmOpS/m38IchOuu6kaTG+ShNJhwlEGRj
         kXcSprYWFKCrysHFgwr1iSalVJtEPEqrbiygrNsdVtGCCbt8mqx7JZNxk9mIVPMTPzyv
         yALBOwULcQezQLQqdx7aJ1G6uw1mA4nGwSlU5kxDKKGtApKpZksxr/2k3idjSIMQZUJs
         QPDsIUWf4FpjrU35YNRr1zwf4c5wFOovN96eJKkuY/zEZzdz8s6/Mj6M1alCZhLhFROe
         txOq/ozbHUViGjcsHbvyAXWFUSt1zk9BD9NkTE7HmI/RZN/VN6f3mXo6l8JRoxyhJMkX
         tG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513193; x=1796117993;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djjFySu0QO/8DVFv3YVS1YU4Dh4wupY7+DOoaSkvztw=;
        b=x9JOyuPohsDtn0Cq5AIIrxVhWImr7WHuMnX0K3akUHdRHh4mog+PqI0CFEJHWsA91B
         mrsPHFqtgcZUVhQlKUJYTVvrKjrAoGMl8Gb4wOPEHH2+N6I4hAqF6+5qTihqpsnWv88x
         Xf/Jy/o5H+loSEIoR/o1fu1Y1dFbxN39KuyIn2W6CgzgIt8GtrSez23yvN6P4IMu+vGd
         vvMmxizaqpb+P5F2sTvXIGs113DjU5f91pf9zV0yLr5mu0G/W05/3bbMiuu3XWz3oadJ
         yitWXjB9pxiqCsC+iUBKjYRj+hSM+Jo9tg/yll8Uk6/eiazbp00YsVFvpg9+4z124FB0
         +8/Q==
X-Forwarded-Encrypted: i=1; AL+hErFYV+HTcqz6yecLyBJGrrnve5X+bPE7b88eFRmLTuZ+b7s4prHxJBr3P0KzQMTl/XU7dEPMStbeeOTo@vger.kernel.org
X-Gm-Message-State: APuU4Z8YpJD+gBxyKfV37ExP+7bbMSVuf156/jU8TvzKJUmfQPeriMvo
	hKrqpmBR4JR4XkyoI0XxTv6M/WzEPfIHPn0M7HukuvThwJ5js8OFFain5/oh8NIvabFGSdCaLA1
	iTgf6AOGp8Y9NRzLGnOVeVSZe27/7HFiop2GFTRduIGnjJgFNj5drF8xeq70WVQ8hJgLGD741e+
	Q=
X-Gm-Gg: AZFdTZehRjd91y6m5KcMnxt0134NX+i8ywd27CxZFDd1TTg10DzyVteStodt+9U1gfz
	gHnd/qe4JVhCX3aWMylSGbZ3oyfntG7qqah2/ini72VOAK2GPVTilDN3Bp0vqdRSk/ZtZyLzA3W
	pxhSen6BBpjcztbPtT0S7QEJa2cmXJsYm+HeU5uowRdO55YEEtXCnSGQCMAuZ2eylnx0bjPR0FW
	wYdx32PF122HiM62BZFScskNuB+zxViO40BqoXRBya722nvYHrm4s/fbWc7+JkiqAjQ7+aQoxSz
	Yn98GiuTFlFatAmjzP0AkQD9eQu97tgMzLDr5SWkYYw3HAFdPLfy1wyOZSY9wlAADflDWRmqVGX
	hfSxv3jUO4i9a0GodZQXrFUK7XgWD9lNinqQSHz//HFovRMTMjx/Y5vQABwhHSnrVmGcMm5McK7
	crtPWMrWygtfEODuhmYAFszI+N6Cp4HrYqzUTZ
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646138b3a.13.1795513193067;
        Tue, 24 Nov 2026 01:39:53 -0800 (PST)
X-Received: by 2002:a05:6a00:4109:b0:8b6:54c2:a760 with SMTP id d2e1a72fcca58-8c87bcbdd7amr12646104b3a.13.1795513192553;
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87353b333sm6763005b3a.40.2026.11.24.01.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:39:52 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:39:30 +0800
Subject: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: Add Eliza
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-add-coresight-nodes-for-eliza-v1-1-e1679ce78547@oss.qualcomm.com>
References: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
In-Reply-To: <20261124-add-coresight-nodes-for-eliza-v1-0-e1679ce78547@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795513182; l=884;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=vrGfhI/rONVr+SjVSKO84RzqNkfc3HgXrWPOpBP57L0=;
 b=dRfjGqSHxhnzHgi1TZAY+OQfBCVEQy/3fQ65U7StJefXhciFR6Q1k190xbBweZUZY7HtVMVSQ
 Vt/7STI3v/WC6m6XfNvjS993SOWQr2GhDNk8fLGfrYPi7KgIF//XOp4
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: aLXCC4aAJ5ouThSfmgnQvbgtRaUZB53e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX19fJYkMuOqve
 24ul5csHpEuiKfZUm8IofiMI+Su+uAUiUdMMDdbg4dgcRGvhFM5aDmgOzJAkpfy4VsGqL0e1mkO
 CYJgPuVgc9bgjrkiv2jJAjPzBCy9sHo=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b055b6a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iCxfB9uofQ-l6sdUC70A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNiBTYWx0ZWRfX6LL3Z7OzuKCv
 mmOkHHooMHCGVRd6jyu3cbhELSC8sW25HKBChLPK95vXWOablXAJJg9UUWkMcuW7qkd67m5Mv4z
 QOnHJoFTTYaVRiilsMRHiPANA+PQmc8i+XakvS0quyGQTO5ToOWVl23wqKsbLy6AuyF7poyJVFH
 arAAKYf0IMLaJEXjOazvfaafoN1fRKaVk70Mc2fzgW7RhtXGTd7BmodjzErkqLxBCxD63Q8hK4/
 1akW75AKEoS4VeEpSCbzoSKfWHpjOQrFavs8ylg58OlDsPlt3QojXUSq8xodA7+0gumqLgkMjv9
 Q1H8sBTIZpHPGLEaGLWe9+WRO8AGzF+PiAcNJQ+7j4+lBmXSxd6FvsKkmNwDtp3mLETyvgVEGQm
 yFO1wF1Jn2wKHQdAhq012SOvIYCvPTopWPpd3N8p55kPHNG4JbB4Cz80Sc3+4DsRGlQqvgUTimz
 DSnx9QmT9vnozfHYCOA==
X-Proofpoint-GUID: aLXCC4aAJ5ouThSfmgnQvbgtRaUZB53e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240036

The CTCU device for eliza shares the same configurations as SA8775p.
Add a fallback to enable the CTCU for eliza to utilize the compatible
of the SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..23b290c097f7 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -29,6 +29,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,eliza-ctcu
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
               - qcom,qcs8300-ctcu

-- 
2.34.1

