Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956C348C4B
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789302774; cv=none; b=FxfliDp7WUuLHjg5eOUOP24M/KREHUyjfa71cm2wGhh6UUVSyZ2CBroLQTYBUqMgfgzoyKDg1dxWyIAvycWvsKZu7ZmBNmtXkpTSzIt56JOlZ35xJlmPkyphJPVG3uJ/SMx8qS46sQrPSq8F94buLlVPuD6YGw3x+CHGMTvAwuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789302774; c=relaxed/simple;
	bh=vns3fWZ9F1LPaW/ex7XVhNsx9UCowEPvW0dJYWFUamw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuGCBErUXaX9gmr5G1ulO8NQKMC73+IdvgRhKV810bfdEIguEm1i9rHAaQvjufuodumTVE+KKjkYHCDkPhZgwIt+cGmDD3/rldbykTzjWSzICX5r0CZKql/ar0J8+3zqfNknMrz4yahmdN9up7JNU0BMc0utCCXAFKhfa3BGuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RqbntiDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFlia7Rt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RqbntiDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFlia7Rt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DAU1qi771934
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+
	RgSQ1VMs=; b=RqbntiDTalTQy8rlGXiX8Zfd6Vw3rdiePPNbbUQWTdqtQeNNb1B
	wbkH/bntEIGHRK0yjhTn3DQWtduCFrx6AygFvFq3bcYX9rlNssRRycd4KSiN9OZa
	01G6uF3kJtPard55RFY61/IBypKunwh9WjjVyK2qbDraglPzvlFHfq/w1hP+JCPX
	EUoox1toZNIqF5s91m/sjgqxOBatVuNHpmscV2GoG0VEiGSCzxbpGsDi79iVC+8C
	Ol9G2bKqu2SJ0HPBX+HEdcB/6gJXB9si/BaganMDGYfDrhbrsquQsTQZftKnGoYL
	NSRclkylaj9yQBTlRQEulTF6WIa0ank7oPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018k3yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 12:32:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1d44c437so31453685a.1
        for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789302771; x=1789907571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+RgSQ1VMs=;
        b=FFlia7RtKzmNoSAimbbNjwl2CKqSYBnLpgYw7gm41DwFEAZFlt2efdam1sRHMkv4fO
         rUGNAe6pj7XsZIL+MfsuKepu48KDWhjfBClUZjbirYQWvX1Cy8usaLR6i1uzbewqcbQ6
         NvXbgt7X3dWG/0cZwcixbwDW4Qnh/T1oI8rp48GBN6HtsH8Sc5exZY5KPjTo7qOkn9Gp
         IrC7Bcnxz/l3ocWdgH2Kib1Ti4R9Rc+9iu5sse6pRSkVZbTZHrHv/n1Y9lcINtuksVYO
         cgVRVGADFtIEf9srFT2lm9XyU2w+An3/MpP5aTQA1AX7CD6UqI90/tzKFEJ5o5rT8Hd4
         eYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789302771; x=1789907571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kplIKopMwPUMb2r9aqBya9m7p+aoU4XVSf+RgSQ1VMs=;
        b=iB/VHCNoGKwOj08MQzRrXRBn6W+MLCzzA5a877uyXo0jRiAkyZ03lhCcc+Vb77PEjB
         pd+IFgBqlScjcELmP6U4QD+XGBRmbJxzJDMCwDLN/JfA8Qmu2+AdwNruNAlTYS2roGsl
         OWYQ5f07F6kYT7Bh46QrM5KIDEpvOF7DsrbdjO0fLkYvzDKdpORHA+lyHSpgKuT+Gaa9
         xzW9cT/M0R/il2CrBs4lrcrB9uGNKC8eVHmOJEVjd1BUQV8/Su3nqWKa5L1VgtofiScp
         9zJhyemAZ2sWQTW9FCiTI4WYi22Yg9kNOgoY7bLaguQPu6QEkQzho8b+GT6kONDCKsd7
         g/+g==
X-Forwarded-Encrypted: i=1; AKwUvByACO8hvoDXJyTDakeLxTHbaYM4XPjccEWkC3RVl34VuQycZNo0dwQURwwShsF6x7NP3RcyX9mk9qdm@vger.kernel.org
X-Gm-Message-State: AFuF++kLyhv623X09ZkVDnOLE8fV69nkfOB3sl30Oxb6ekjRgzdzt+o5
	iOlp23XE7JR/SWiNyohkOK1VtzV985tyio0zXIZetdJBs99gGhhNHrnqEO1OVAOwvQtmLa0XNmp
	RhZMcMxcvdYedX6B5pmdsyB+d/hLpVUhfo74CTQaC4VDlhxbEBUdsN20d+kYFYriu
X-Gm-Gg: AYBFou3nberEwLU0yc6MzpGPjJUyX/31HprlI1BwX/YAs3UdmPunwUTcmdMqKl0Va1l
	n4m4JP9kkBSW5Wagt5cxbvk9SRl9Yje6Ujgi6NX0/tuhxWAeUu1Rgo16LUA7z1g5hkJCQyJimtU
	UYZ5AU1dt34AwZ/bbHN3PCQvCDzupimPC9cbYZ2TdvmkDoglgs5vlwajMUrqOAtda+PUxkvvdLb
	T91GMQL+L2P7fdhQfPVp9m8CcIvT9rGf7byVIAygUGRQZYuR870yLWOjHabt+UgcR+auPKtx5Pb
	gE4fhNArub514ofZB+R1IOVdyIEFfX3Rxy2K+7orm1H9IkCeXvAIP3NoJBfuLDn6F4mEzfZfgw+
	1Z12Q8txHIcdpQ+Q=
X-Received: by 2002:a05:620a:410f:b0:939:57ca:7e0a with SMTP id af79cd13be357-939ea0e3ffcmr2118425685a.7.1789302771560;
        Sun, 13 Sep 2026 05:32:51 -0700 (PDT)
X-Received: by 2002:a05:620a:410f:b0:939:57ca:7e0a with SMTP id af79cd13be357-939ea0e3ffcmr2118400285a.7.1789302768225;
        Sun, 13 Sep 2026 05:32:48 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm18582661f8f.1.2026.09.13.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 05:32:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Alexey Charkov <alchark@flipper.net>,
        David Mosberger <davidm@egauge.net>, Li Jun <jun.li@nxp.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: usb: Use consistent indentation in the example
Date: Sun, 13 Sep 2026 14:32:44 +0200
Message-ID: <20260913123243.100040-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7573; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=vns3fWZ9F1LPaW/ex7XVhNsx9UCowEPvW0dJYWFUamw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqppfr2T0eDO30H6kD/uma0qpARjtXnOfpYvbHR
 mgm6R0pIl+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqaX6wAKCRDBN2bmhouD
 14zMD/0UULishGTn+lTzSfFq+0qYLgpwtzcOwgRKwsxUtSLUWUTXcSWm3YQfhlVnFwv0fvvWvC+
 B58ouK0p/tGUd32rKCZs/YsttShhPzVAn7sM/KlOEY01oMvqr8atJaGdicCIHwh+vun6qQe6nCP
 Lal8NAA5KFPjH701Vmgtuzdj40v0C9SwP2JmDIsqCJklZcgFmO9jJW5w48MXy0AkfymqqcRzmFd
 +AP9oAd2iIFNDjynn0Ym0FbTkiBVLFfRI4Vgfepk8kPf2optAk7TGwf1dIZgCVS46KNCwN6Pm3Q
 kT75PJoHoSalDQnCmC5UqI2ggwN/K9e5ptbMp6+8Zv0IxY7uC0sNH8cWLMkAfD1IGHCG0Cva7uy
 5eUm9fqlIhSq9ZhF0sxDvVMm9O80wJe812jj9/13zrk+1bPP11M1R1EudL4SAYfRXJf2yasCX93
 bNxgmNDYjW4qK9cWFu+il6L2jEyDWQsWGigXT3CI6uvTlrwlIv78Kqb2uuuJypGaGtsOjQ3oogK
 YLRe53+Lsit4WoHnAAFpP1gqLGueq2Psc2tXrosli7mUMj+bFtI8JE+lb80nc95O0YC8/mpaf53
 JmmE3YNrcKG8cWJlPJDg3QUfTWHWilbqYtoJ+JN8tIc1NzXKwImDXGvdsJ1Q6rNBbIHEOeZrd91 khXdc4vuXEM6b1Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa697f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KDEBpenjW5rMv1hHu3kA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfX1qX6fLjbrCmC
 EMq0l5KioEHoT6FyxorZrrstN5lv8TQeTK4eLgtfbyhOsx61WzJ867GI9Xi8QjXr/ZMIQ/MnOG1
 gj/TGY9GL1j1+v7EldnYi5zlWGOZ4a4=
X-Proofpoint-GUID: KOnmJqT4vdoV_LHYCJuzd90zKPiBAtyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE3OCBTYWx0ZWRfXzXyJZrRgiosx
 /DxjRb9kVxnjoTnIpptHpCipG0V0Bd9YfVzZrWAqztZaOOf1D1TvXSthJQfCmy29hPtoFt1Bsar
 dO+SijrZgbFEA4FzF5cjApHJhoVlB7UPTHZmxA1iqz7ts5V2TOpEZmdS6GJVnJRmVqMMu/Q6clZ
 uFWrLL5YErcW76Q7sZbh2y1vE0wUbgfE2/4MrclvOwqvZj6lDmqE05NQ0m0lbwUovl6YUcfM84l
 Z5VubJgjRQnFxH8dRqJ6e2QQB6JoZkFcrd14dajP8BNDM+ATLG3gtimJAzC+Kzi+p0Vdc3cB1sN
 hL/LtrIEAJLgi5UcgYNFRX12AvCX6ew/1Bas9TnRFPDzGkKwb8Fan2SkR7J1eFJ3FDeDyflluFS
 H3CSRd6cyzjyHWHNguaexKObYLuCQdmq9kESTJ92g+RywrfI7ldGoZAdUBKpu3/Le0Dm4otjFi+
 078lzDVjCxxQ6gSrKsw==
X-Proofpoint-ORIG-GUID: KOnmJqT4vdoV_LHYCJuzd90zKPiBAtyL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_04,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130178

Correct indentation in the examples to consistent 2- or 4-spaces
indentation to fix dt-check-style warnings ("example 0
[indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
re-indenting entire example just for that is too much churn.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +-
 .../bindings/usb/corechips,sl6341.yaml        | 20 +++++++-------
 .../bindings/usb/maxim,max3421.yaml           | 12 ++++-----
 .../devicetree/bindings/usb/nxp,ptn5110.yaml  |  8 +++---
 .../bindings/usb/realtek,rts5411.yaml         |  2 +-
 .../devicetree/bindings/usb/ti,j721e-usb.yaml | 26 +++++++++----------
 .../devicetree/bindings/usb/ti,usb8041.yaml   |  4 +--
 7 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 620b564914d4..26731c45a604 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -130,7 +130,7 @@ examples:
         phy-names = "usb-phy";
         vbus-supply = <&reg_usb0_vbus>;
         itc-setting = <0x4>; /* 4 micro-frames */
-         /* Incremental burst of unspecified length */
+        /* Incremental burst of unspecified length */
         ahb-burst-config = <0x0>;
         tx-burst-size-dword = <0x10>; /* 64 bytes */
         rx-burst-size-dword = <0x10>;
diff --git a/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
index 82996791aaf1..4ddfc7594846 100644
--- a/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
+++ b/Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
@@ -61,19 +61,19 @@ examples:
 
         /* 2.0 hub */
         hub_2_0: hub@1 {
-          compatible = "usb3431,6241";
-          reg = <1>;
-          peer-hub = <&hub_3_0>;
-          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
-          vdd1v1-supply = <&vdd1v1_hub>;
+            compatible = "usb3431,6241";
+            reg = <1>;
+            peer-hub = <&hub_3_0>;
+            reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+            vdd1v1-supply = <&vdd1v1_hub>;
         };
 
         /* 3.0 hub */
         hub_3_0: hub@2 {
-          compatible = "usb3431,6341";
-          reg = <2>;
-          peer-hub = <&hub_2_0>;
-          reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
-          vdd1v1-supply = <&vdd1v1_hub>;
+            compatible = "usb3431,6341";
+            reg = <2>;
+            peer-hub = <&hub_2_0>;
+            reset-gpios = <&gpio0 20 GPIO_ACTIVE_LOW>;
+            vdd1v1-supply = <&vdd1v1_hub>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/maxim,max3421.yaml b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
index 4639be7ab059..042dfc3467d2 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max3421.yaml
@@ -57,11 +57,11 @@ examples:
         #size-cells = <0>;
 
         usb@0 {
-          compatible = "maxim,max3421";
-          reg = <0>;
-          maxim,vbus-en-pin = <3 1>;
-          spi-max-frequency = <26000000>;
-          interrupt-parent = <&gpio>;
-          interrupts = <42>;
+            compatible = "maxim,max3421";
+            reg = <0>;
+            maxim,vbus-en-pin = <3 1>;
+            spi-max-frequency = <26000000>;
+            interrupt-parent = <&gpio>;
+            interrupts = <42>;
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 581e5916eadd..fe9a02f21c67 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -67,10 +67,10 @@ examples:
                     #size-cells = <0>;
 
                     port@0 {
-                       reg = <0>;
-                       typec1_dr_sw: endpoint {
-                           remote-endpoint = <&usb1_drd_sw>;
-                       };
+                        reg = <0>;
+                        typec1_dr_sw: endpoint {
+                            remote-endpoint = <&usb1_drd_sw>;
+                        };
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
index a020afaf2d6e..9c8868c478c0 100644
--- a/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
+++ b/Documentation/devicetree/bindings/usb/realtek,rts5411.yaml
@@ -84,7 +84,7 @@ examples:
                 port@4 {
                     reg = <4>;
                     endpoint {
-                      remote-endpoint = <&usb_a0_ss>;
+                        remote-endpoint = <&usb_a0_ss>;
                     };
                 };
             };
diff --git a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
index 0aaaadb584e4..176737156d77 100644
--- a/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml
@@ -94,19 +94,19 @@ examples:
             #size-cells = <2>;
 
             usb@6000000 {
-                  compatible = "cdns,usb3";
-                  reg = <0x00 0x6000000 0x00 0x10000>,
-                        <0x00 0x6010000 0x00 0x10000>,
-                        <0x00 0x6020000 0x00 0x10000>;
-                  reg-names = "otg", "xhci", "dev";
-                  interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
-                               <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
-                               <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
-                  interrupt-names = "host",
-                                    "peripheral",
-                                    "otg";
-                  maximum-speed = "super-speed";
-                  dr_mode = "otg";
+                compatible = "cdns,usb3";
+                reg = <0x00 0x6000000 0x00 0x10000>,
+                      <0x00 0x6010000 0x00 0x10000>,
+                      <0x00 0x6020000 0x00 0x10000>;
+                reg-names = "otg", "xhci", "dev";
+                interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
+                             <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
+                             <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
+                interrupt-names = "host",
+                                  "peripheral",
+                                  "otg";
+                maximum-speed = "super-speed";
+                dr_mode = "otg";
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
index 07e13fae640b..e75956f0f85a 100644
--- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
@@ -65,8 +65,8 @@ examples:
             reset-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
 
             hub@1 {
-              compatible = "usb123,4567";
-              reg = <1>;
+                compatible = "usb123,4567";
+                reg = <1>;
             };
         };
 
-- 
2.53.0

