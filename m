Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497808;
	b=DyEBTG2A7O2GcVvo/vJ9PBYsS1yXjGb5eQe1ynhHaWr2eaKi7clKqtB5mULlvTNRfHN5
	 VGMV0tXydxnNE9jx+BqV9km3GLHgnltM7JIbqlGujlmsC4aS9f8UKhiHROfOoq6NT3avo
	 IVFiUvo8m8bU7aM3UH3o9U1H+CZrI+ju9DOscL4rTqmgKAhQiKa+4WOK8/xryFms/q2o/
	 BCf66rFjtS9yDso6bqZLb50sRZoKJ9DLNzXJDDLvZIZaSf7XmUpQifBjIlLmpSQtVDugM
	 bQVsTTzHiebty11tfo1tljud7YJfcsOUDmMJs5TsWQwPjNM80XQu/0dzi7BBomnN9Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
	b=XdepJ1eIkN5D3DqxH4JKj2Dzamblej5+yOQWczQga5XmGvaN7/6E3RMkH13vNOtCzzdR
	 Ei6wMrwuyYvXE/zTfgjtwS1hqqA7oMZgUy1fB8MHrVX/ZQttxo6Vp3ZAEd5jhE6HaiLHn
	 /OmFloUeiy9Pgl94siHdXzK45mh0wnRyavY6iyx1QK/9BlygbWnJgTCVLl7JwmwKjDJH6
	 emrCXeM3IGpDZHcJNXrRCB3KVX6Qu+NdXj35a2Nw39eDQjpm0u6BZuijbj/xUVi5X2GWl
	 cu1VTRao9e9NV+S0K2qA21oO4OpciHyTtnmV1iVrR4Epi763/OYMWzFj2wt0m1NIBOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPup8h9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxQ8NT56;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8E606A881
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21A8E606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiPup8h9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JxQ8NT56
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFaNP41593447
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=; b=KiPup8h9fQVaDAtA
	+jJUw9V6fkLSzoBZJPK3oKE2P7AU5W67keThP0fq8zKk+xRIVJNae1BR5KWpeJ/l
	pssM8Ki8s8fr2MPU6u1bwb1aRPSNkNNOKNxJqGFgJ+m4Mod+087tnQocy8paaDQI
	/C3IIJGx7uOME0cmzCMAEI+BLVI6wVq7VyOjMNhSu+3OYpqph6AeeH3a8EKbcqRE
	3fBCifC8Mu6B3FyVc7r/xUgUhttdx/erP0gcQC5KDuCUlPojH5W6dgA/WbTs0GhE
	Vw3ngYT3aChUuUxWfWi5nlJRlW092kzZ8f7SGKhnccDMuymUMJ/2muE/nb9Hnq8e
	YJGZKQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8kg15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 15:36:47 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so911116137.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 07:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497806; x=1795102606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
        b=JxQ8NT56mx5RC0me2fHeF3uT6SByozigitXZJMwEhM99MDyjC2jnGu53Lm70l6j9Do
         8w5aC5osS/86sb58LXrXwnFHGm6Q56kDnWWrnaOYictK2QBgauVLBhBW8KbJrkyIsgFp
         L3r9/ZmaIZ/xJSAOHKjK6bgN/rMZZCoEWq113EtlqqlsZVLCzV6tBT+Cb82c0CgmCIbw
         MhAtblkIUaone8H9RwurKjX9WPtD/N5gtUFZwOlEPQyFgFu3lGVvWJhne6gYN17xri58
         q97F7rC9QZpgFaosg3gbqsTric5gQxa/1qdm0GCJwSYh51kSBv/dxIAb6fW+5kiS9aJR
         396g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497806; x=1795102606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8AlHHOOcH0J8Yer1oRtneotbq3Wdv4IOMjaRc3msIJc=;
        b=JyII3FlXkjZLGfI4wUut3qGjQgowImtH0D9alUPuMHQZeQ9ddZbEJlNXahxprjPRz0
         I7wHs+AflvuQAUgbKwDi4a6U7RNtsxJxsoGFicvbEXeKdGtgzb05iBM/S2gH9MyaCR8K
         TXwLxSfkNlDaZ4fEnGh3TuKgw9z2qkPac/pJAsrYbBcE7LgLzTtTFggAwAPINN6P4MyX
         KlXEXHny4WXvwj/DCuBnYCQ2LvE2kWkwM9Xzv/mHhxO4GywHkVL+FhqprYx9zLck8ZRc
         1yXU8xL6VrdTawKHF3g69HwluIXUHcaQRUNMaZMl7n5Jjh6eZ3ckhNhSiTlzLOM4YkIL
         x57g==
X-Forwarded-Encrypted: i=1; AL+hErFqaEyQWHbTFhP2WJhptu4C9X5j5PFQEe/Ezujq6OACTsBnrMRMM8Hw3AxTlLHiO6A6SprpI1jiSte1@vger.kernel.org
X-Gm-Message-State: APuU4Z96ysa6RKqQSVFzYxQyVlMwhVeS4YTq7Jb5lppeW5c1P42XYjEv
	HOn5YgKecXPSHNexcm76/cQb/ysSvS8p3AIJe+HXn3wzeVxyVEgICfmKFzNKwJGIhrqI8zOmNyJ
	lmEJptvIbs2jpvnOY7nxnbR9/ubaVJkT4ZSE3JRSJLS3UiTtTV9CKzURutAZGas0K
X-Gm-Gg: AYBFou1vYgRiaDVPGrKY7UbZeca3mDMX9OOHJWKdU+NZTTnMbTt9xp35x2L4kSr9bl4
	NAbcbMLr8X6rYy1IXmT3vT7VfzxtSalknnMKu2ljj9wAW2APJCHk5OJYDHrJZTafRerKux7nGDz
	NPqYfS5bc/zI0Vf4ozUYl7izrJXeWfTCuJYA3q3XznxKf8SfKJJSZwc+IKeW8YcxWKZQ227ym71
	1Y3tg69ytPp65VPt0Xtcl1tpzuooiGAl3L4OjAbirgo8izx1TJLtVn9koyxAB2vKHmKjOUBiyB+
	B+m38+PIDfVRCm1MzJX11mGocYtISXmc3bH71f0zkfBOh2jLCdfV17wv5j+o8Ph1VbwaYa4Asvs
	SzqedtGN11TA5vniug1T0Tex6Lc26fScyEYPXm+hTBCnpQVXRdun/JRqv29Ms0DqBh8DPdsPUvn
	XjCQ==
X-Received: by 2002:a05:6102:6a83:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d4fb2db138mr2027731137.9.1794497806329;
        Thu, 12 Nov 2026 07:36:46 -0800 (PST)
X-Received: by 2002:a05:6102:6a83:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d4fb2db138mr2027721137.9.1794497805797;
        Thu, 12 Nov 2026 07:36:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:38 +0100
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add the cfg_ahb clock for Nord
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
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-1-30ad3d947217@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1878;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MYxtwx6oSY9pEafESek3VC8deiLRo9hu3VKNcZ8z/D0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0ITiVdJuWn1AJ9v/nPh87x/keI0+PcHah/O
 fojoOmerCeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w6izEACOL6wZcrWuKa8sIiIvcUG4OZNoEmYMS3cuGhOz7NFCzHWfQmE1ffjCEgwuZisRDIDbPIO
 nJDxiQEMJD2Args6Yxnui7TvXnyLZFRohlJt9m7oThnEeN18z6Yjh5YCHEDZ51H7y1Pg0+qhn7Y
 L2gSXyxVa9upebQxhHMwwcMejRWn49GZeL9JJQHjYILS08sA/wXEz+qFeDEQeZonC9w7nto8Pm8
 +AVtUckE8ibCSlIQ/crS9js+BiYUdGQn24EAW5maYL+FCtZ2szziovQNgovKhPktmkHmQ446Zje
 BoInuuZiFx/mdP5okOnNvnZoipCahdtsZQX3GTIXF3AkS+gUwz3C1oyg/Q9J2KToecfvUaW2lq1
 hOC2wK3CyCi3XM5lp0YlGQx9D7Q7LtGhHA0eDhYrNNpTlD89TlUP6Zm3JLlizkpAEY/SwJZ4pYJ
 J9/q14S5VXhh5dRI+qL8R3JIL1hPFH9bC1EWC95j3+Soegef5HPzw2XWN0AjavtmzvRE0rfCsZZ
 HDzlU6WvuL6JKiuLsNWRwFNRH2YLKU0rZBbDaxITEVo7McDtecBTk3gnmH9nyumQ7IE8AstmKpa
 Tz4NSS3H6RkYeebVKpMdS69rVfjUj3gpDViT59ZuwjoyCBGJSKTBQ8BNleeJd2j4C5z69vbJjkJ
 C51L7TkrTlty+Rw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX5cQ3wXMtPMnF
 nC6lGmt1saklryZJvfkkAzrRVeJOLF/gTHybzrfw33DD0Jb6Qfy0QlmbOSU23uRqm18bGpdG2+j
 aAVkUPTDu/w/IlBiLSFb+3HeQN2y6MM=
X-Proofpoint-GUID: URSoyXXivVhjv2cjkuOKytXDKQKpNZ2V
X-Proofpoint-ORIG-GUID: URSoyXXivVhjv2cjkuOKytXDKQKpNZ2V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX/GOm9yPRdjl7
 yk1wd9M2ATfW7FQq+yCsUwj7rUyUlY4aFyACFqto0XH+OSoTBvzPpvx6zc+fAIumGiMqwlAst56
 /FfkIOxc5eSUF1b6adi+n82FI24RTbabGFIKBxh2oldlWujzmgdtBjSJ99vpE5ncYid7hYOvfjY
 Osaapq6RBGC/RWJCfWN0HTauIV0Et26inAXyFZR495gFKPYvQylGSmCufk+ap1TVeoEb+iVPGAT
 2tgvnwLDx3lm4Y3ey147UGYaszeAtVBYTgHP3FCBk5DYhCjSLw1gyHqp7RMKxIClUwZchXvmD/j
 9V34JHr+94VGC534mqmM/vRjANtUMbhLQFZ/8bRoXzAWtdbLKHTFp0OX8aapobd6ad1sHWrvS/p
 PFKLIEcktmsNTRBnwimVIYVCqcmD+ptA61OFCR/4I+w//0HorgQu9JQeYsusv3Q6kRO4GSLyd9Y
 CLcpHEXjGW4cc2AZiWA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5dd0f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2jpwp6DS_NLBz8rowOEA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
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

On Nord, the USB3-DP PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Describe the bridge clock
as a fifth "cfg_ahb" clock for Nord, using the same clock list as SC7180
and SDM845.

While at it: make the constraints stricter than the global settings: set
minItems to 5 as all three architectures require the cfg_ahb clock.

Fixes: 674e602140a1 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Document the Nord QMP PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[Bartosz: fix constraints]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 13e64fe510b8f..8d09e6937fef0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -209,11 +209,13 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,nord-qmp-usb3-dp-phy
               - qcom,sc7180-qmp-usb3-dp-phy
               - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -229,6 +231,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,nord-qmp-usb3-dp-phy
                 - qcom,x1e80100-qmp-usb3-dp-phy
                 - qcom,sc7180-qmp-usb3-dp-phy
                 - qcom,sdm845-qmp-usb3-dp-phy

-- 
2.47.3

