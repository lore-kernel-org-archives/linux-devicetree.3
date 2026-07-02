Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F59243964;
	Thu,  2 Jul 2026 05:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782971312; cv=none; b=bPhZDCjDMFUXHoaSOwxSo0xajpfRKlUsqV6lWOcyjsfOTU6jFzcdhoWf0oWhcGZJmCMxs4SLC1/XHDIf5y2qtQ+OpxFs7blJWEguItay21mCwfLaBOAcG4cxD+jB4W6ivuhFyc3lqa41f9vl9lSEVuc9fQo6kfhdyIjlEtn9Jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782971312; c=relaxed/simple;
	bh=epT/YAflznsFXfr8QM8Vmu2aErymUyKm6/W0jelkg7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/GaKJj8B7Zn+a4JD0n6yvJlm9DfcXbnCEZnt/oLXtQtDtJDmKbve4QsokGP+Qe1bJUKlAFciQR6nCsqwMrbOhISo6IDFnmB3/A1pX7NIe7SPvHIbbHg3tn6vh8+iWYsR5zX1jiTXtkdgaX3veLsaI5AMBsr1e+RN/6/zXqbnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.102.93])
	by APP-03 (Coremail) with SMTP id rQCowAAX_OKV+0VquqinFg--.7549S2;
	Thu, 02 Jul 2026 13:48:07 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joey Lu <a0987203069@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: display: verisilicon,dc: make resets non-optional
Date: Thu,  2 Jul 2026 13:48:04 +0800
Message-ID: <20260702054804.164820-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAAX_OKV+0VquqinFg--.7549S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AFyDGFWDuw1xWw1DCF1kGrg_yoW8JFykpF
	Z3uF47t3W2qr13W3yvqFW0krW3u3Zay3WYgFn2qw1UG3Z8XF45Xw45Kr98W3WDAFZ7ZFW3
	uFWqkrWYvF1qyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

The only variant supported by the binding now, the DC8200 controller on
T-Head TH1520, requires three reset lines.

Add the reset properties to the required list to clarify this. The
in-tree th1520.dtsi file isn't affected by this change because the reset
lines are already populated there.

The driver still considers the resets optional, so if another variant
with no reset line appears, only the binding needs tweaking.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Fixed wrong reset line count of TH1520 in the commit message (Thanks
  to Sashiko).
- Added Conor's R-b.

 Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
index 9dc35ab973f20..919a900122012 100644
--- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
+++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
@@ -75,6 +75,8 @@ required:
   - interrupts
   - clocks
   - clock-names
+  - resets
+  - reset-names
   - ports
 
 additionalProperties: false
-- 
2.52.0

