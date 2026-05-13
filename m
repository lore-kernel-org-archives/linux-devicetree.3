Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7631AF1F;
	Wed, 13 May 2026 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778678300; cv=none; b=CABkkuqiP4vvhqf9JKFyaJ6gmxfdh7eXBQTIsVOWFJQBTeTsNXzOzm+p5afkELSVnbWQCsWDnbEczHh/I7MrN5LAHfhyYRs01X0k129pKB5pX5++om0Rdn7VqAgAJj6u9+BHHF+AC45/TuHIuu12zq0JPzziS5D3YO73tyoReoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778678300; c=relaxed/simple;
	bh=UiQCLW3CogQyfPKHqhuaL51eoRfncuB5Jy+dPeyp4cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCsXfkaTccMgEgMJIHw1RGHGbstJ5rGqL43x/1McMg3soxrZJb6wwfXAhy+2ZczGoUsFdbDXNkiI2sLoAe+uKkfBYcRQZphFN4g9ZmV1zVilsOYrAnFryzCr+rs5a111m5oXq3wU6Q6XXTaiW+lJq9iuu6OlTu4R4gaCy1U+pnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DB7zQIf/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DB7zQIf/"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B1D82FDE;
	Wed, 13 May 2026 15:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778678283;
	bh=UiQCLW3CogQyfPKHqhuaL51eoRfncuB5Jy+dPeyp4cY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DB7zQIf/nmW5q4dAWD05vg2TAg4+8HxVgD7hH2G9Pcoz9oEr7acXJIH1mjslu2UsU
	 Fw6aRskByaqHWs14ExTEBxFnL2h858bzKVKqaU+S/z91zdCqX84R8HTtKfVWhSqQdl
	 CIwvxN6ZZFQdJY0UjyENbB5H6+qt+rydedmZEQFk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 13 May 2026 16:17:36 +0300
Subject: [PATCH v2 14/16] arm64: dts: ti: k3-am62p-j722s-common-main: Make
 main_conf a syscon
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-beagley-ai-display-v2-14-9e9bcefde6bc@ideasonboard.com>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
In-Reply-To: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=977;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=UiQCLW3CogQyfPKHqhuaL51eoRfncuB5Jy+dPeyp4cY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqBHoB4l1YpkguDETJu0LpPAQGFNbaYFPgpAEmz
 JrY9prgNA6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCagR6AQAKCRD6PaqMvJYe
 9TePD/oDcWnDUi4dpTb99mtAQMZ5Tc6yx0MIj8U9H17SDAdzND7A7oTRftjLeUecccRfHcMLdaQ
 ISIH3lDtFx3dumH4AN05Xyi8KHSSHbA7+fOBMbHkjAbNYfbIB2XcVElo3EeZlmyd+qSQdKu7EfR
 XpcvAJcsYl9N4+LwwSeBG6Z4O7FfEyzet/nVg5ahaqhxDba9jwi2L4XtiTv8QRkQu6kJOhRChaO
 Q4zYwRj0RoHbVtbx5R6vTqbME3H//Tm3VUMJAXlBLx63k3b9yKeW6T8wKkjUYzK9e/BnICyGiaF
 /jj/nwSAnw4vfSCLWGd+aYhKi7VYSBBLJdNnUGkstksZTcgFgQpw4FQSlVzEgP/J9qiEaUFRfHY
 jPBMbj2k55R8Sy10Sx0LHe9ZSuMLN7Bsq6Rns5XrKPP3AS1j5/D5AYW6kcI1XFXz3+07BMbEQP9
 VYBPxeen0geMHbSZ3E23CsO+PaDn3lIQ1/eLy6zNacypgPa+RNZV69HauCDOCXx27yNu7rSSxUq
 dvRobHIAK3fOzUEUq6DCmecxZ5kPgi6MHSvvgENSANd11Z11DJFjczjSjg5PXC9n0JFv/GtJuKU
 foBTaqnemmr7Ckd4GYRO04KGwChuvv6FuhWkRLZlYL/AfYc0/83esZEqcQOl2VECzfNuI8tE0i/
 lt5Gcs+Nhd18ZAw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Change the whole main_conf (the CTRL_MMR block) to a syscon. As the
main_conf block contains miscallaneous registers for various devices,
this way the drivers for those devices can get access to the specific
registers they need.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index 0e1af2a69ca2..41067f2f1425 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -40,7 +40,7 @@ gic_its: msi-controller@1820000 {
 	};
 
 	main_conf: bus@100000 {
-		compatible = "simple-bus";
+		compatible = "simple-bus", "syscon";
 		reg = <0x00 0x00100000 0x00 0x20000>;
 		#address-cells = <1>;
 		#size-cells = <1>;

-- 
2.43.0

