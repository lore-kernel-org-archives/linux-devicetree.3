Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497810;
	b=ued2uoLyRyHlR/0hIphBTGSg77WZ5fS/RsO6ekII6a35YdeF5GHyEdhYqKjRcD02rIRL
	 Qns4H5Kn6ZO5IbPrdVWEu2lLXPPhtc+IMt8exfYbh5BZFcRMOnCdwRdMDwwN+TmLYh64J
	 ybR1xPZFhMHgU6BvGnK0TAfyIh6IUIy0Ae2hYMo2bOI42Lk+pjfRV7m/GISpZ2IeOKm5q
	 7a1sPIv17VrWWJFiRpexpwoPJnMNUSabZWsB1g6Ql+qAzYm99zGChXGLCPv1kR5QbSDSU
	 tSm+QbQW780wYVJQx5FlDR00YLJV531bykuxhk03nDxiyqVVS39U20fIr/60vTRKPMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
	b=djpTP0aVI+AZVV+HwSOJ9oIsyeNIl6tA7H+ngTMiW6BEmrZttt6jwA6RQc/kcj7LRFaq
	 w3fd3ZT6CKA/PiMJetV5RjsUMMdUPcPuOIiLDRccSf0ndBAkm1yEWPFb2EcJpugKx5zZH
	 LwnT/2c0XL27unDJ03khmTClCvSF0qtMJhMmmsht2W6B3lR//WehQ0P1ooj+QuJNeGf5J
	 Z4iC+vecrtFit1DVwoNfNxhXuBZ87XeLDJRELLVNnNAszMEzAMkueHtjgWxyJ4+y4Ye46
	 hzwLzdA8ixbBo46ZjnX3hqXfxkZ2mOP0FtKgRGSAqpbfYvMp+PCb4T1NjbaBeMqLqPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE013606A896
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE013606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaX031594154
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=; b=bH0ZZBbwFAtooZ6+
	aUvXug+ZyNhrwWkGVectFsOPazk2nJo1XbmVYJP9qkLXebpbyYil/xlmKsWCfZej
	dCLQcXspY13eJ/VR5QkpMNVBXfuPCA5WZq3dPjQ9BE6Cc3r+gSGhGNVTDxEZanxp
	6Wmc9IqIA0XDazAheDnHc7wZFlWwBMgNEmNwOeKc+Jafy7UN19315ZRI2UXzgIxx
	7C7h0BiMqdgOiDX0Nzfe9U71wRwbP+z/fG9r2YaKPa1LMEIeH/e0LU4vxgkTsXp4
	Dju4ZmeiPrznfc8JJzuRre+w3tO7s9IHyVu4KAyAw5D56uO017IQt6HhHiaRHzdK
	0TGUyA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kg1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so616060241.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497808; x=1795102608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=ivQLuG8I0QFJH0JGM2PdO5B+Xy5Bxm1lXM7ZNkLjPu8Ono7nh5flL1+WagJzfH6ZN9
         1jt2RQqqRVwIfdIiI4nFuxhWGwBkXW+n/NORh64j8a+tpbMQTDEXM0w1RCiWN6oKPfKi
         Xeu59U0293/t5iw1uWj2EvnEelTCkxojjasBC3z5IQM0Z15pxTPGoqK7+JGgVGGZpNWf
         Rw7mtuLeaozF3OW8BGQpyFCgE2sTH/1gRp8NZ0VWkdCFMhBUKM/2dqYTDpX9K3+HBnFw
         nJyHBOqOIwN093d5TrD0WdfJTdW2PRGBhwrehwZqzJjc/+vHOuLRtmPpidZCgtiyixTx
         /qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497808; x=1795102608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=b/Fgl3bEtfuQtUXMN2zt11xW3K/6MkYp7i7aQyh/ciGnA0IlzLWJfmkjuNmnPWhrfx
         LYBPl3gsqbwugjCY9AtyOmW4JnI9iqJV6lc3HS3tCT+QU4uiv1iHEULKl+DIeOh+rtOS
         zQA0/RWTZa3rNAqO2rm+rw1hF/NDXTBpNH8dtFO057WkSZQCUKFdFbShpzoCudp/ETW+
         prmnIogmGJr/8DWrH9t0NxRvoMwJ684DHBeblV6hmrTcM9iBS/hahNWSZoEGr0mFYQ/r
         AVDLcrtTFqi0ZEtyaKAOqRebQrj3bMoEXZueTqKfwBW8zIWucAmvwPvXQl1cPjhj52HL
         mBjQ==
X-Forwarded-Encrypted: i=1; AL+hErGIXv0fi9LuEJONsmm8LH/1wpKmh0tfSgRMS4ivOzdO4xaccbjUoYurpEVCnmxK6SmM4775N7ZMrTVn@vger.kernel.org
X-Gm-Message-State: APuU4Z/iqSn5/05ABE32CeOBcn6TSlDFgm+BvmWZ/AfcVmK/lQdzluw6
	pFIGNLb2zJvb1/nfAODeKxz5sI9dtAh6C+GDvDtFaMeN8UrvMJHxir7iFV35AJKmzRpHb9M94bY
	V6U/Fyu3zncrScq4VsgrdTsgKxJx+Ot3qbXgR74WwEtEVFc7v+pfeC+GUyQ14scdU
X-Gm-Gg: AYBFou2txhJ4mphVCpVJiO750NdUPYJfFzwORsNxCePosLhcAcyPQmqMIVwjTpA/7hW
	DNIZogSu4k3HrKIIu/APpMmdpthQU12mwxzRSTBN7V+rJN9ztJIZuNNhbBFN0QBdnHvNRDpke+D
	kwCpfle3Kk2P4I55385qwvhYVuxtKbqfB7T7RkC3YEujIvtedCQKGEjDB7P0OL6zoS+MPfMjahl
	LtCruXnRrr2vKO/0qBX4o6Zk7Ob/EGT13PqsOoL1g9jtfej1yRSW8EYL8ciLd7RraOmKb2aDuLz
	cBGd+wC7rhnBUZDBbTZ0B5t0PCaRQwktpf6fjayFxa/A0NTA+64gLNA+RxSVHaEaPEjA2r05lTT
	IUufoCmxhByewP4RD48WG33WvpB0RwOju895o+PFeoes2bEE5b2TZbafTIAW1vYceNjjLahyWf2
	HmtQ==
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099517137.8.1794497808189;
        Thu, 12 Nov 2026 07:36:48 -0800 (PST)
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099502137.8.1794497807693;
        Thu, 12 Nov 2026 07:36:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:39 +0100
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
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
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-2-30ad3d947217@oss.qualcomm.com>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P2V+JNK6+l1UtqbbRQrYDDi6Drwba1YCgJEpyneVFMg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0I6t40xtjdl+V+j7iVm5y8G3QJhQgQiKuyb
 hBTtNqP0DqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w4ZmD/wMCXWaCFC9VAweSsB8FI/e0bIqdjmRpNlodYp/YPRkCeGqFuia7xy37qYNm+u73hfriRE
 hNTahZzVjpooPaJfPy974giG3artxayNeKbY0k1JrmbriqL0NkFG8MCMvYo5GKJ7yRrttD5B59R
 AfG1P3JOWA7kasQiexiDIfzhvyc4XImEOQ6d3JS51iJegHtLC1PjCACWx4OVyL6Yjrdc7prUNcG
 5gmpq40zypC+yxSNgoCTg9PPacuEw9libt6weqeB5KlY6ad6wFN6TsuXVjXvmAB1W/triFS1PrW
 07XzzSdMLshPntyqBNDAcirhmf7unN+2QCqfeaxXaqYntqi8HAfXUt9LcriLGyYYNwgScsssO4g
 jdwLUsFyBvLyJ+rOrqfiwbcb1hLxK2B86nSv8bY3gPp+NxVJndqsSCI4wqIisHr/FkkLdhN7Sh2
 0aiTHq3llXqjQaQYOvNDrmZOzB74f0B0Lkfd0/WoTAN2hGNfLnuP6mJDZITi6QrRSJzDm3D1sZL
 qi9IvhrLogEfPEAeXk4iRmzwTvXeZEkDz1qTqptcJacHDl9Nvxd9aTsz9jRmZk0QhZrg+WFogvW
 I80EX9CT452JASeY4eatTRCzNRghDk7c87XgX2/3f9bEiCj3T9QzMf2f6ZBs7m9iu8KssYWeQx2
 G5YAexuE/58Dsmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX7YO6lsSkIGgQ
 HQBJnSTgpP23YvNJRo27aQ6Unfnkc7Q4FnZmx3Zo9lBeBtHzt4IdDvKDeDAi9KBUvawIlHRycho
 UWXbhoz4z9aJbEVbhIaasxty+Xj/zNk=
X-Proofpoint-GUID: ZIaBShlPcmM549-0ArVTo8-F8bQcWrxl
X-Proofpoint-ORIG-GUID: ZIaBShlPcmM549-0ArVTo8-F8bQcWrxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfXwG2/NZUsxtDg
 CbO37a2cz0GAwspJtzA249LWG4yWvTP6N7N+ai1dC29OBgZAA/o357tBTHvwsMXNNyoCJCeN8hf
 ZCEmcBltEBXpQcxmNpG6IIBMvdrJD3bU/hDLrJu2UWURuxGivOrky/aYQO4PAcj1v+PIcEPXLUu
 C+ZwIBSku1u4kjkcoeVVD4/Z6Fb2QL051lDW+e+rHdOWPQq5SKelN/ZFPpr5eYN8wRPmGTWwSk8
 7lqZmgKpAswDRRHsXgePJBhYlfv+v/SKZAiWsD0Ch1vTDt5gIJOPByAUW8kdMlqvmrLXvmGcF+d
 eh/xQHwMRruL+cvTNKsHqu7Zv38algUeJ4SOB+BKBwGNEinzE7Kaum9vbxiP4t1iMZXjxYfox66
 F5DnNgITEhtGEGImfaIpw3vVkShesK/G2Sm7TtCWkSwixjJR5uv02nuTYcMxO9pQ43Xvu/d/4+9
 DFrXYXYF+CB9AD84oeg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5dd11 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=tP9VjBngxETQ9kDmeHQA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120062

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock. Since the Nord PHY needs the second bus clock, it's not
really compatible with sm8550 so drop the fall-back. This is fine as no
DT source uses it yet.

Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297e..fbea2129939f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,13 +19,13 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
-              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
+      - const: qcom,nord-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.47.3

