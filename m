Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526E4F0545
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646773; cv=none; b=Y6GlcU6EOZK5Tt+0j1uYaKk56GHn/pS0GInQ1PQNScaWW3YX8o3GEAVGS2YyGEou2VCNUtKLAOUKsvoiuElhIhGZXjVtzopReOSWSb82kO3Y1/WSzCrEZBY/4J/HtBFJzBTTxzLnZeqbGvo/5ku56gB6llakQSARwARjAlr1eW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646773; c=relaxed/simple;
	bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gvg1JTo48xkVKYGijkynL6/xVh069WWePSEOaVYegzD5imDTsTC+zZhuxLl2N5otQGTHqOLYWk3iN7dFwb0zfqTCaTKm8e7wWsVX1FqYoZNNGgA3F/u9vEN4OF/WxVxxMw3DZyQ25VMCkRoLGP0bxXcStNEHSWgWqPOdAFnZs3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H6BB9sbn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iEwIeu2A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H6BB9sbn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iEwIeu2A"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZkfV1150730
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=; b=H6BB9sbnO7VOarVM
	JyvJu9HR4dFUelkONDeSyz2/0SuVydHLIcQVsBw+w+sLzN6FIXG3VyKisjbic1Iu
	0iWBFTmGzzV8SjLlNpx9++uEh+ghnTsHUCgMQVnluz1Sut3W/AWcc/ktTTRIFhc3
	PtP2H0XAzwkYk2j0FNjERAZERTa05BXTKgOycQLaAxOGsnrEUBGTImAXT297PbsR
	v1Niona2413WsyelIiMeKMDo1tKU74uikSsLqiACGKT3QeVmfL3BJ/EIHdbGZJSK
	Z6Guyf+tokmxrIHQozZVk9EvPp/r6E6JEQtE9ifd+F1uiigZ21HcDuchH3m3KqHH
	E/AJXw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grc9w8y10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 12:06:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc2229450b4so707438a12.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 05:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646763; x=1790251563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=iEwIeu2AzW5MZKbCsEmKtHkwm7Vszvx1+9la95zDFCZrUhbnW2fZ6MIZxWDdm6g8WV
         /y1pvSyPdeF31DfTzNkKXTmgw5qZSWuv9l2VlEtsEs1+ou4q2tkeVaKVAL4arKANewSG
         XL2iwg3DmcmDkMRVqlfnW8+D1gnsB2axFB1Y4fX0BGBDisA7aMFISmGoOUq5yHsjxmZp
         7h0Svq84ft3HX05LZrfuYKp1b+tf0pu8cvqhSsKknZxaXdP/j83i9/vantKa5+w85BIi
         vyqSHqegVSnzKK66hbelkfyT7+QfgFXZ/GFfaLqLVVV2wKOqLpBNTN1XKi4AB4LXjC7x
         XasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646763; x=1790251563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcN9cxBCESt1J3bXNleQd1twegh5vS95kmmxkUSr+u4=;
        b=Ya5OyVdlF2zu5VGnsgysw3gVNl4QtDS6qw5Wd1S6Ud3D1z5kAM29u9FxKGfbs4jCgW
         8rbVzRTd2Cssh7AKcRHSiiQshbFz3/vaNhJCTr3t1VyP/hTR75Bz3H7w4rUkFMaidiYi
         uY5EiacL/U/7YzSbJUNya3fr+qLdo0musd0x58vr7R9CWpH5H5+YUnSd1nOeWNw724/Y
         7bxbj6+VLk4cOBexRiegXXU7CLjbTGo4b+kyRZpRbjhXrEmJ82AFXCg0x3wv4QExmAN7
         S+TkV3gHG+zFjLHi7923rr4EUhX7pGNJIuuvn9FivVJQMiWRAhIxaI5iD7I60y7FZoZc
         JmWw==
X-Forwarded-Encrypted: i=1; AKwUvBxuUP5wTMI6+NoQ0Sw5VlIxOGIxgoP03X5IXy0TgRVzwepYK1L+XhH9Vw2BuJRkK4ZSt3b+xvLMK5z2@vger.kernel.org
X-Gm-Message-State: AFuF++lfa3uVo1AWhwT5WRQG+Ou9B5ZbVrYaQVEnp8EoIRQepZ1+LTaJ
	Dx03382jWBRvU7IZro12vz2E3Ps5+R4ek4LvuQ6i+LTCc5xjKgWeVvXdhf4NbZy7zvlqeXqWCJz
	yviK/0Av/Uyb9wL+kUM0mMx1Qoo7Gy+3rigoZMl0shkRbvkZBFBKVnrJwuiENmutm
X-Gm-Gg: AYBFou2HvFBiAYTETOpP6Mqro9NELNsnXCQDErFzeZNY0VHYqMzB7MM+gzHbmz1Ow1f
	wE2eE8cKhvq87qwjSSZgI+myQgeW04lsvJP05Yykh0GQHicU6VezqZY9GjKTMGNMWiPI8tRvOMI
	LnRymubqW2rHbU8bbkkeqoIe7HKhogfh04ZEBgKa4QUOXDFgZkhcP2UfpNeaL5PVnh9yFm2pYkE
	Y7cOZJKsn1D/QckUwQPfVkNNP86LxxBkxFCl+4d6jRW5HsBGy26iV9/On+mBx03QkcdWUbNxxfO
	xqNFnh73Hz7jgPpyFCVYG4w6X2qYmnVG995jys53BqxEJuN1f4Uzq0vamU3Np6TtyQbo3QAOLFA
	lR8FNmbKHQi7bLiAuPpEzVbg7YkAjqA==
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454826a91.8.1789646762729;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
X-Received: by 2002:a17:90b:1648:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e1e2f9e12mr14454734a91.8.1789646762209;
        Thu, 17 Sep 2026 05:06:02 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5007612a91.4.2026.09.17.05.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:06:01 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:35:41 +0530
Subject: [PATCH v3 1/3] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur_camss-v3-1-1d0e2d47ad2e@oss.qualcomm.com>
References: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
In-Reply-To: <20260917-glymur_camss-v3-0-1d0e2d47ad2e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646750; l=1015;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=bicoCk8fBJXyVQOPXIB8KDJTBtOMQ5lAhdZI61Ev1rg=;
 b=Vp6CS+/Epro3msMsrHzNjpbJRpl0Dzqcy3rIa8rXwAaoIaTSovFc022WtbnFpqPXNDumH/kpK
 xVrA6iJTmv0DOaolFx4T1drOvYXTwLp4Ztaa5UbPhdFP+CvTy96jJTV
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX11AuBT0g5WSK
 DHU9UFWdAGU/3fE4ctYGQYOh2SlfnG2L30njLQSZhtZmqoueirALib6kurOD/3MGFunwhf0maWO
 oRO+5DFB98xhstv2vtefw4enZxpHvC35iCLzxMHFR15GYiLDBziEH9V3ZxCH/epKJR5yrxU5hRa
 ERSq67xjU87JUTw57j4Jily0nmXYGBoRG8UJWOlZp6Zb+RNRoNZdlLDmWzQa7nr20xVnL4JQhXv
 asq8rJh82ITXp3QAKpEouiC/n19kZdPbw59Jy2B5PZFyL7R794x1THzWVmEn9aDhLQ1ATFbKstu
 arYmQw1/8N3t8iJ9f+kia3rlQpg7n9+iVVAwDmNoYkCL/7Pivo+K7HjpQtULoIaM8UJlNpSEfFe
 9De8AlATnMdtRukYG9IbQb0Ri3HQDvopL9lPdnqAEO+IkFZIs7d2GyZvGOTRjIy/vm2sE3wGhhi
 TZpgsIAxv6pe2CF76gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2OSBTYWx0ZWRfX/ISUTP4G6rle
 AtuwebCakNFqZibyhGqmNTpJNbKZVEDUOZre7nKppvBeppc3ZDN/69BENpQ3XNRZN4zUWQuZl+c
 k4helgw6KWL8uHPkxQGI7zTp9ICfmGc=
X-Proofpoint-GUID: WX11g2hHvZCpPiGGABFEa15lWBcJNrgx
X-Proofpoint-ORIG-GUID: WX11g2hHvZCpPiGGABFEa15lWBcJNrgx
X-Authority-Analysis: v=2.4 cv=EsZHPicA c=1 sm=1 tr=0 ts=6aabd7ab cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TrU-ok46ffbKF8Cuv98A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170169

Glymur integrates the same CSI2 PHY IP as X1E80100. Add
qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index dc64af97da6c659628729a758316353798aa98db..1f1e2a4993b2aff9a1519640bc4e04ca98fa4baa 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -16,7 +16,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,x1e80100-csi2-phy
+    oneOf:
+      - const: qcom,x1e80100-csi2-phy
+      - items:
+          - const: qcom,glymur-csi2-phy
+          - const: qcom,x1e80100-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

