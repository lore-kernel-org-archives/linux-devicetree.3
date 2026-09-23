Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC65542EE8
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 18:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790188836; cv=none; b=EKo+Kgb0rbksr4K3ijPGyO9Ht1+CsstSYmqRMOLpBwWLJlvFh9SygMnI9Y2QxouMQnFEOtpV/TWBPsX3Jkhh5neblVp3fLFYJCN0lSWpbejUKGiVmerHS5WLgc96dkTf6MUxqWUuneoToOonAVybDDRxbJc1JLA78S0QR+5XqbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790188836; c=relaxed/simple;
	bh=LjI2SsSWKQZX7ULnYkf78v7gp2sgIgsQTM6Mv73WTwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LOCXe77PQUm8K+dB1WeDm2wu14C0km+yvlC6I+ZK3xzdye127W/x8UIYyHyrqCTlWVw82eumoa2Q5Ibd/UxB576AzIr7wTbCUAPe7L1CJoFAJTklgfHlWM8vxkRv2slx/uQnjEMdE1Kt0qKFBSaNwOMMyzz2kKaw/nYqasphgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXbJh+/d; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXbJh+/d"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso977291a12.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790188830; x=1790793630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gc3lVJFpeHvTVPTQlhw9bRs3DHSZ5NaiLqgYc9qgEg=;
        b=KXbJh+/dP+H/DVta2SZjpyc6dT+zKM0g2loVnfAddOHhWjdLlHCqhNc++/Q/682VBz
         iaNnQALzrBBhWhSUBLQ0LC6N1/489yvOCWRz4bVrbjYzrfjZDGIbZ92Q4oQctw9ncOZZ
         V9HsxJ17HQ2BqKZ9AvrlI9MNz9s/FjX2lU5yEot4BZ41S++7joy2Ll6qWQRavgjhZ0bn
         cBj4FALxgDPm4RCCdiucgK01PZ1/q8yB5qADIQT3KIm2Kop1cLJpUvyODk8f/m1ODn4+
         3rryejjNb0oRd5QnhX2rhlaSHTRut8O1JdMuTyACKFyMSIliuESIYpxLl0FRuGQTu+Jf
         dlqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790188830; x=1790793630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gc3lVJFpeHvTVPTQlhw9bRs3DHSZ5NaiLqgYc9qgEg=;
        b=nnBT2sdH4Wnio0FYSjBUf/cFfft9yCXyLTP0ijox4Nhm9wALo6JeMoQTKuuF71N+J7
         YePEOpdp3olrKs03eRf6Nbcg/r7RJU/M0O4ujeXcsPPZJd6icbO51jj89q05EcCeV3a7
         th2UucSZG2FnBMkIKtIaQmcQtpdR6oscUb9cGy7US8l5eMy9GgRzpTwEndjp9Qe4rrks
         i0ZXHRl7xNi8nMRehsVFr/tNxCRxKyeFCXqvR4kNmVxNnSP7P02irhF7D9kF4fx1wjvy
         twz4/NshAbCgUSKjaZdZpp6/ONFm0JJL35c3EhnJsiIMWhWCXKsBoK9uRvnRCgB4bO+e
         hIVw==
X-Forwarded-Encrypted: i=1; AKwUvBzqz/GYuMEgzA3UxhjQDGgH9ewqKgBmbnjJwOAz35/pX8+U9RfUFwaBbzxh0L3HyX1njDm/w59elZW6@vger.kernel.org
X-Gm-Message-State: AFuF++kvSp+rFaEQ+d+FAFSAjcyLt7KlSJhDjhdHsUqikIY2Y9/a3Zkh
	ADXYMTHDdibwv1b42sP73og7M2zd6sEgN+VtuNmQ5oqNiMFUgk54XsQv
X-Gm-Gg: AYBFou29gIcb20SYD3SWYQDIf2kd4NqiqE8kK1vwqonKxRroD10mqMDJrc9XBeJLSB/
	0pXWC7mhjOCQstnSpXphLbTeQjg/Gp7/wizpvWkLD3EVoGdPXmrA05UjhQARCSwTi0FEQlVtR1A
	dYeFjXDIzsXgb4uvepT+Be3wU1h0t2AdadAo+/4dGBMBlaQBlhkODUKSE0F7NB61lrMN5hNVV+N
	RBwoheV+4JCUFjd3qi3D0wsC5xNhMGMkQCNgrFFyYmMztDybjVvXc3X+tndxtOnjELccrcwcNTi
	cUp9s/rSWlcEsVmPoxd9E4y4uFBzx0M3GD5X7rZz/tPfvJaXF6J2X/3O3ACcSCKt83x1KxTNQGo
	8rw5w3zpYlbaSAOVNamazfpXin4HoCPTh+HpVd+HQodMj2JJwpSfwE/oxDEAS/jfDSTw9sYI4go
	g6oqo+HMFX+qs1A7qGxhB7fWBOlOXei9+j4AuycvviXUV+o6eDs4ZmBeVacxdxW9uJ03/wZCzH1
	coA4xqDf3byY+NuS2lsKtsGjlgMTA7ffekCO87pdrSa0YztkX9deF1++ylqT8WsexAodbAZMiM2
	zuNCGU+G0/KmQJKS6ICQnFjs/lZFOFn/uvjhPP9foLCiv5KP
X-Received: by 2002:a05:6a20:6f07:b0:3cc:8f53:26c0 with SMTP id adf61e73a8af0-3de0e73d922mr85921637.17.1790188830372;
        Wed, 23 Sep 2026 11:40:30 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm1644341a12.9.2026.09.23.11.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 11:40:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] powerpc: dts: turris1x: use qca8337 internal PHYs
Date: Wed, 23 Sep 2026 11:40:28 -0700
Message-ID: <20260923184028.13830-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QCA8337 switch has a managed internal MDIO bus for its built-in
PHYs.  Declare the five PHYs in an mdio subnode of the switch and
link the LAN ports to them with phy-mode = "internal" and
phy-handle, so each switch port is connected to the correct internal
PHY instead of relying on the implicit legacy port-to-PHY mapping.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/powerpc/boot/dts/turris1x.dts | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index d0b7c62b8c6e..58c9e7b34e50 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -174,26 +174,36 @@ fixed-link {
 					port@1 {
 						reg = <1>;
 						label = "lan5";
+						phy-mode = "internal";
+						phy-handle = <&phy_port1>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan4";
+						phy-mode = "internal";
+						phy-handle = <&phy_port2>;
 					};
 
 					port@3 {
 						reg = <3>;
 						label = "lan3";
+						phy-mode = "internal";
+						phy-handle = <&phy_port3>;
 					};
 
 					port@4 {
 						reg = <4>;
 						label = "lan2";
+						phy-mode = "internal";
+						phy-handle = <&phy_port4>;
 					};
 
 					port@5 {
 						reg = <5>;
 						label = "lan1";
+						phy-mode = "internal";
+						phy-handle = <&phy_port5>;
 					};
 
 					port@6 {
@@ -208,6 +218,31 @@ fixed-link {
 						};
 					};
 				};
+
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					phy_port1: ethernet-phy@0 {
+						reg = <0>;
+					};
+
+					phy_port2: ethernet-phy@1 {
+						reg = <1>;
+					};
+
+					phy_port3: ethernet-phy@2 {
+						reg = <2>;
+					};
+
+					phy_port4: ethernet-phy@3 {
+						reg = <3>;
+					};
+
+					phy_port5: ethernet-phy@4 {
+						reg = <4>;
+					};
+				};
 			};
 		};
 
-- 
2.55.0

