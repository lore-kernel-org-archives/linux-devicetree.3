Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9513911BD
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889412; cv=none; b=kFjk3Ujzdnb0edhMHtoMLaC05mnLyuNckQEGkkDELOy2yLYJQ5Sk4UXgzNqG1bXRmZaZ1Ybuk7TycPhU/dMlTifI13DSjJgAEGBDz96LtG1o0LnYRD0fAerW686DD0EfZuMSxHY40WuXu59HHOxJ9Jzelp0kYkv5XUZ95hlqsGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889412; c=relaxed/simple;
	bh=HElkjSCZEjUxRh9S6WgPJ0hL+GG4FcM+5VPQWUU3Ask=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b8/Ar1COyJJ72SHTg13hHB7YQwfbBFresAnIRJHr0xioZgSRC3au3OqPKc75n9qj+E6eUyWyFa3LiGrU4kRoPBTeI3rOrcetdwY9K5WnweujoDxXSB/cVTr8G3E7zqLiD34QY+icZHNON/GaX7H3W3rwszkaNIUhacMSZAKLYFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUn01nCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j+H29dId; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUn01nCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j+H29dId"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8dGuL3054806
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9J/rHMnqzSTznjnID/DQZdtKHmt6ZnAiVdjltxjn+5w=; b=lUn01nCHg+o0RZAd
	SnSyIPhjmuoSVtJ4PJwkt4Q7qZqdD89zQTaME7YbL5zg9EngqhoXaJIYMf2wJ+Yi
	iIgXpjgVv1g8FkJ9rimkIsnc9mir3zjMUIMLl4H11lvRrayJqLkF9fgG8qAYX/o/
	Xd8hG9OBAKLNSBQKfUXrdIeppE1Jz8m5szgUDOEyMVYPMujYylMmLLsKRAvhLyaC
	hC48MEGYSn2X302DknRIJ8ZhAhNiGZqqpwFF7VNrIDOH6hYSQ2ds8nxzhvrVuTq1
	oDNlfvtWtdQULakoWJt/H0uutzMYNNl18UAw+AA44375Z+NfsvIIKj9RrrwI2iqy
	8py8qQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuxmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:03:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a8041a532eso2144279a91.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791889409; x=1792494209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9J/rHMnqzSTznjnID/DQZdtKHmt6ZnAiVdjltxjn+5w=;
        b=j+H29dIdUMGHli0VGLHmyVBnVfmKBjyxIlt2scUzsx028mTeqvJiPuDrcMyJ/Au3OJ
         w52X6ETvleATGq+exFo2SzpFp4SS66fKV3+OGRrxxPMFOcW1Fh7DS1GHZCmB7uvZv49r
         mI4Kv/kMBEAMKBdk2wPGnfBhiuzWn9duMfZ9jz7ZMZgw7Nhss+7Ex3mpF4z6SWOs8u/K
         7ePRFqIo9qaaQm/qbbWY/8YkLStb2bd9HA74ynNwizn+0y0RBBEr2k3SXp3gxbDS6Il5
         59rRQ9xlMQO23G2wG9w3yFQE7Gm8w6lVA8BwWK2ItZaokKplalkWuqJr7LvAL8P9CAzl
         HfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889409; x=1792494209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9J/rHMnqzSTznjnID/DQZdtKHmt6ZnAiVdjltxjn+5w=;
        b=m2k+mmPKlUrHNQ5LofVyrlyvN2XujU5FGDndE0Jk6HM1NY7J1Yf41h9F2rwHho8Bsj
         iGZzeheX/dzkrqLdZAlFEq/s3wDuVkYlvK3O5SArJfcaU8u/tQZXpKSGshaiVi9Rc4Hm
         HEoN0o7QK817rt4+SytrNTI7FxZT4q2Idt5YgJmrd+hY+eFghsDfqOV38mLodweTN+o3
         +Z0l6Lv8FtEiJYSQY1bd4SK7korz6oHeqLSNCmqVWMoMd9beOfwwbHPldP14h8YJlZJ4
         0nPO8dnDAgt17KI4RnvcOWRpG0rLf6We4YmG5G24tMjXD+UEj3GQ861pBXAnUEKUG18z
         z56A==
X-Forwarded-Encrypted: i=1; AKwUvBwDM1vv2jVcg3j7JIh3jIXn7oHvfC5GSZY5Ulny7TtTWRF4x7yaKoi2iuO8i2TBFA49HcOGINtl0IKW@vger.kernel.org
X-Gm-Message-State: AFq9FYKKRuGis05STi7VVf/deGypG2PrdoMeNIcnGBC3zYo948G+lGpZ
	GRz+KLSyWNn3dmtM581qHx5eHtg+HENp/SUnaeoDofZ2Pfw49krHomxPKMKjIZxoiEOPw/+JcmQ
	/wQyg9/QxmPDy7gushwZinD9h0USbuc01gcw5xsE2RWJs8Ufs2aSjg5bIoM3FRd3j
X-Gm-Gg: AYBFou1A6SLwnvVXhtKj6bZAo2KzNgQWUdZv95XVEc4qvZFgwNRDbUg7METH1ZyFZpY
	+PgnQKPdoG2+u89FPzwlA+5ER56Ak6dfHbP67F/L5UXJfAqjJkLzin34fujQMLpzBGQfT5NWIaV
	hUrPKcgv/aAGNt1DcyseBUpZKIy4/loR/leDw40xtpoaj4rebI7W8oPDA16Tatpx3/yKMzEn6yp
	spUdwenHvk7G1W92yCvNJ6E+ohhoaoTT3U/1zg09cDxDu6RNkyRR0/vpHEpJZ2ssF4CoA6EnGE2
	8bgLel0Depfu8k+2X9QLFQJzscLHor5iH9Lr7vKvD+rEv2sGQq1AiHXgwXRyqc37hjmspYfxrwx
	YRpNuK/OIfycsbiRgDSApKk2FNvXuWPU=
X-Received: by 2002:a17:90b:4a45:b0:3a8:bb9e:f8d2 with SMTP id 98e67ed59e1d1-3ab3a9aa915mr9789861a91.64.1791889408985;
        Tue, 13 Oct 2026 04:03:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a45:b0:3a8:bb9e:f8d2 with SMTP id 98e67ed59e1d1-3ab3a9aa915mr9789834a91.64.1791889408475;
        Tue, 13 Oct 2026 04:03:28 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36f46dfesm20808403a91.8.2026.10.13.04.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:03:28 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:32:44 +0530
Subject: [PATCH v2 2/8] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Hawi
 and Maili compatibles
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-hawi-maili-camss-v2-2-fc93222da89c@oss.qualcomm.com>
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791889386; l=1331;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=HElkjSCZEjUxRh9S6WgPJ0hL+GG4FcM+5VPQWUU3Ask=;
 b=SO5o0ntyOogXjZdPNF8QPj/q3hLsuOA3X9J2TKV+Dq9GR7p4+bflb0L3COeVlONuL7E3xBKO9
 mGR9EwasLA0DZ7ZUd3z14SNpX7JAMVIukihJOdikCvM7HFpxtDds2hZ
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: e_bp35E_3HEIoQjl8scog9fRpsOuu6A6
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace1001 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Qbo-v1IXpRF52dvEqNcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXzH4tj1x6TaJ/
 1ih++44vvvrpfgxrd4mA76f1W6HJs+nnY3XmcpXkGHuk65B9rd9T/ppKxwQOi6B3iDMmc9JZAdf
 ZQGJnseqP08SUscWuImJ+HiZqPdRHqk=
X-Proofpoint-ORIG-GUID: e_bp35E_3HEIoQjl8scog9fRpsOuu6A6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfXzSPeuEtUt37s
 YpEezayQL+L7ohZR54+6f+QtG+ju9WrzXIbrmjtIqIyj9fCCe8I1lTWQZhi/WatVh1cLDwCRBl/
 6J6FOz8v6zUl/DPDIWAKRx7JYAD3tGNbkHjh6Pqcc9+ypUIkSClLsJ0X2GcBDPwoQd6EZUB9ipX
 rapD+FZb8uMWEC2j/gQhJy3XawlOh6OO1FHDCtbhfkDrw9zUrMplu5E1LNGV/DLjwckLjcpGE+U
 g8oKaV6nQ1wtpev51rnTRxePxpR2UBIjfMjm3kZj1fwAYBpIs0X1bdiExp2CNmDAZq/gz9bvfB6
 V3rR5HWXBXRkaWFnFe92RS5p4BTl9kevhm3LLJHKB13Np90rMYruEpLxg1QPVkCJ8QbqWxtjAjv
 XpOL7snLCVwwQGOSOLt74oJzQRq+Y6/IgNxajzmg/UVmXUKcWWcNYIJS2A2XW5says1QEi7wbhD
 dJ/QIJllN9n1GUU9Ogw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043

Hawi and Maili integrate the same CSIPHY IP as Kaanapali with an
identical register interface. Add qcom,hawi-csi2-phy and
qcom,maili-csi2-phy falling back to qcom,hawi-csi2-phy.

Co-developed-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..627aebc7cd9b7ca313457d3f70f72796e9671e8a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -18,11 +18,16 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,hawi-csi2-phy
           - qcom,kaanapali-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy
+      - items:
+          - enum:
+              - qcom,maili-csi2-phy
+          - const: qcom,hawi-csi2-phy
 
   reg:
     maxItems: 1

-- 
2.34.1

