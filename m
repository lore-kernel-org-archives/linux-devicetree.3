Received: from gy.d.sender-sib.com (gy.d.sender-sib.com [77.32.148.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C18A346AE1
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 06:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784184958; cv=none; b=LxYlK46DQq1Nl7yvFSSjvUFOFzPsWiO5dk7tGyzpB4r28W8H/tYIRvTeCyr8T6cwdkB+CXL53dhSjtw3uj2ROfkQ89fSEwr+lLDGlnEMOVyGO5tRFLWSgvKu18/vUQJjs2MMjjvcAXznu1xi2hS3BElE4drcdv5Qz93lhT4EWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784184958; c=relaxed/simple;
	bh=FfbPOSaj0zn01zjg0rq+7dgQAvNltr31/UWNc/GioHo=;
	h=Message-Id:Subject:Cc:From:To:Date:In-Reply-To:References:
	 Mime-Version; b=QKNaVkFnhhmtCZlRNoPldwjS0YaIP2UIhWItBAepDGU5+CNdzW+9XZRJ4x17i8RHnMIwk6n0ZMctF4MrRoP3NsvdM6uKFq1SbmTLn/YSDZDRc5W5w4cBwK6xobrV6PSgplNAnyzd0V/MWmnujoEyR186Ef0JgRPTycTZivmogiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com; spf=pass smtp.mailfrom=gy.d.sender-sib.com; dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b=Uqj05vSD; arc=none smtp.client-ip=77.32.148.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gy.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gahingwoo.com header.i=@gahingwoo.com header.b="Uqj05vSD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=jTAATjYPhuU81OuGKaNMSYMV3823/3WCISpb5ZX8+PY=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=Uqj05vSDxj/cWLaETj7gmBhKQvCIJ3kMlK6uJlPrj5Xi3Ojxdn8/Xtl7iayusm3/kw7/0FCd3I25
        uHZTtjct9o5mymSEISOOpNppIAG3nwapJ8gJMwbDfQLgZ2ajZPQQ7JD/kBZLbCaeokzEQdaSHjm6
        VDH9zfvFutoyh9perRM7tAjCCN+fy1aQRHoPKGMOlJiDXMqvUsyNlu15K7atHZRu4y9j6+PJTbeX
        EfbITQCrCzkU08bbGljlYLnbj07EEiRSxsH6TcDK0BSBx5xYGVnCQF1BKWJuJ7+SKaUpsHzZhzvH
        9pWjvAERymWgU7tmpvhLQdalZ88d0bi4HBunuw==
X-sib-id: CeH6NyT9HM_DZf729gSfG2Z_xcT0_lhekV6UjcwN-2M15-jt5-tclv6beDJHzOh0C2b_gm6YtAYIs3xU13IicRwUlGOndErXkJdyJzyrL65HuDCis1wXkfk5UIcg9EwQG8eUApxAFuBSC1AMztellwd-cjND6FzYliyExYx4Bvq1esj3sXFkQCQ
Message-Id: <7e27ad59-0ffd-4323-9991-d00d69fde098@smtp-relay.sendinblue.com>
Origin-messageId: <20260716065548.2466198-2-gahing@gahingwoo.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Cc: <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDg1NjE3NDAyfmRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnfjwyMDI2MDcxNjA2NTU0OC4yNDY2MTk4LTItZ2FoaW5nQGdhaGluZ3dvby5jb20%2Bfmd5LmQuc2VuZGVyLXNpYi5jb20%3D
To: <heiko@sntech.de>,<robh@kernel.org>,<krzk+dt@kernel.org>,<conor+dt@kernel.org>
Date: Thu, 16 Jul 2026 18:55:47 +1200
In-Reply-To: <20260716065548.2466198-1-gahing@gahingwoo.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0


Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Document=
ation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
=20
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
--=20
2.43.0



