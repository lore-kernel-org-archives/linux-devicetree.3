Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2ACB44CAFC
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903866; cv=none; b=PrZlNYF+dOoqAu0F0n3GHq6gZjig+cECn3sn9uq4SbQhEngbDona31cAD2b8hzOFdpQlw0Rr7BZjKCxc7Q/AOrSUuxPYZUHwSv5lPiMQeqpuo+jcqZIEzYxiDTurUa5MimrBDzvWNKb1bgYhPQOTfNVC6VMM4aWt4HbNyK2AbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903866; c=relaxed/simple;
	bh=w1AW7fS3rcAbZzzmqiOgA4kIKS7JUA+eY+sYUqUFzqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsPWA9EBPmeUDCHBCoeXeCIB34MQZk0GcgRs6qujS/woVoymRIfwdgVNo2NblWoreobILnvKqjDGIBGLv25cZGoRrsVcFUcqu9OkOOoe4/psTfUhrMm9KHA5BzXvWxuthQFYjky2I48YHQQCmQ/7WPH0TIx3dvEf0JxO7N6Y4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaBmYl4x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaBmYl4x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802B41F000E9;
	Wed, 27 May 2026 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779903862;
	bh=1bam8ZRCLqualEQIsKYimQJ1F23JgrKdfTKCBeEN7kc=;
	h=From:To:Cc:Subject:Date;
	b=LaBmYl4xAqKR220GQXs1T6XnVveVxflxv1gw00U8d6AkRXMYe/RPagPYFGEcs1Aef
	 SmC/jv5dO2dPy4ZmL5fFLeGoFVFoXuLr91jrxqdTGmJtzkzZDAmzwcW6qRo9Nafn3b
	 3FAwBUQtNFRs2kZ7QkGgw/7+tEP6srfxZQNfbwLRmS8AqL9Ox630m3u6XKdNXqV+BW
	 E0tMgj0P5QDY7k439bjQncuaSFyjezQpCXKI6TNBTdGAL43pjPLB9M4D091WnksJJ/
	 S1BzbFFgUwUf1I6HwzB/owI/G/4pYSFgZwppcvHpZMrhp9rP4N8eu3vjPz3WmFODIj
	 m3HwsEt0sBXTg==
From: Dinh Nguyen <dinguyen@kernel.org>
To: linux-i3c@lists.infradead.org
Cc: dinguyen@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	adrian.ho.yin.ng@altera.com,
	alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com
Subject: [PATCHv2 1/2] dt-bindings: i3c: dw: add resets and reset-names
Date: Wed, 27 May 2026 12:42:19 -0500
Message-ID: <20260527174221.79259-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.42.0.411.g813d9a9188
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DW I3C driver is already getting the "core_rst" reset name, but it
has not been documented.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
v2: Added this patch
---
 .../devicetree/bindings/i3c/snps,dw-i3c-master.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
index e803457d3f554..7a39fe62bbbc0 100644
--- a/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
+++ b/Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml
@@ -35,6 +35,14 @@ properties:
       - const: core
       - const: apb
 
+  resets:
+    items:
+      - description: Core reset signal
+
+  reset-names:
+    items:
+      - const: core_rst
+
   interrupts:
     maxItems: 1
 
-- 
2.42.0.411.g813d9a9188

