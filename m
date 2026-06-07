Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62B36F8EA
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 08:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780820466; cv=none; b=TXMBSby5BERGRjgNaxRIxiWselYa+zzj+7g1xS3I5L+Wo/lKbej+fGai4uSVXs/nnpLmSgzS8DOKhc0ydNXZFrnD6eKC7EkwN3PEsXFjLK3ATak4Ce9DnHi3sG0EAElBLU/ppeygOdtZRiT8osU9Bvr+6k4XF7lqrCthjXszFCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780820466; c=relaxed/simple;
	bh=YQERmjO6hBoH6+GdyySBEbETr2FTBTtGkTU+7Ccv33E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1W48VWMvvl4YbSwkyqgwRH2kiSbQ9n7W4h41nDl9fj73AH75L2Wr/yTzry+b+weLKnygKpY1xOqRTj74fgXkZIjeascct2MNay1//u2t7McWT/FYL7BgbbYGthz8BXBTbMQFGNVdbBDPSrJuIiHQSxnjwG83i2gswjCIiYvGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=bdwOH6CA; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="bdwOH6CA"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-138129a622dso3732842c88.0
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1780820464; x=1781425264; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXENIPE1x+qpwB7xDgysn50NyxQ6tMkm/oN0K3KXyn0=;
        b=bdwOH6CA3MEm4icejJUJyYT50xPCnyTJczYxHbjgj8rN8tah5IIh+5eQ8YCgJ3CEhg
         uI4CpTox0e5V/hdhDblZhYdum7d3DRyFVxvMZxW1O6ShC0buxyTv9fef1aqOO84stQwm
         9dOF1tRx+zTnwGQjORkBi6TVwrogUiTUtAn2Wvgp2lKnI8vfufQ9YmWJQM8VJr36APGE
         dOUiiHhwTqDAhU7UQcmKVU2qbjdiPetc0SxQ3hicYoB0yhiCHV7LTnIqtHqcVVbKkfqI
         vnhDoHsv7QP+IKKTpGCBSm1UKOoeAKeDVcLODpm7X4Sk1WlpdaUecbs6N9bIj0cglqP+
         NPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780820464; x=1781425264;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXENIPE1x+qpwB7xDgysn50NyxQ6tMkm/oN0K3KXyn0=;
        b=Y+WjSMmpbtkeHkp9BeaLHf5vpdbtBfL0jpXZY566dU0JEW10LTikiQU3exYz31r5Cc
         1bigih4ESHgMyFls7zjEfs8Ktdee7Dt33rHu7Z8LVeqlTKXiWYMspMFToKVvB+6p7DoW
         wIRhNx8n4ZFHXQmdgKAMS1Jq1CkxJ8tMfoZB8B24KWRw0jAu80XKEiQvf6aV+/N6EyYV
         BKYd7jlqpY9VFc0N4NIVcAbe1GqpXgn3cVYRScW+zZgrks8Cqeip8q+iQd5BzvzFT+rv
         PI8/WUFVb4WG+Xx/mlPZbaCgLgMMLvvp0DqhUj11VMcvFTOgo03/rmZ/N3+2CPiSWfUZ
         Y5SA==
X-Forwarded-Encrypted: i=1; AFNElJ/uV9PpIhourIwev3MSqZ1iDCMFTlvcqcbdwAOxkl40OfS9c+d/exGqXJEEQndTnj2fwf72+zisWQF3@vger.kernel.org
X-Gm-Message-State: AOJu0YzguNp0Qf/zfa0+ewgzjRX+WlPF0Af1U4CEV5PzBAaaQak2keLw
	NaUf6EqZwAu/yp6O4EttbrJJKZnsT1QJb8qtpKPHHwUNajpkAqvnoWb/u6bTofhYG/oQ0h9eTa6
	9MyAL
X-Gm-Gg: Acq92OHSQ14LF8uWsWEzGwxae9Vm2A9UYYt6sei0ErOc6TMpBbUcCOqBT2yyOAzvxcS
	wI8RWf9qfa59Tv9RQ+Q1pBVUPPs/hbQERt/3wnJPORmmKByOmM5T4mZ8Am/JSPG3YG4KCw4g75z
	cT1P+TJylKtLTN5t6A5M11Gly93HtOk9xynlwuqZI4pZyqFzZp8/s5PYYyaoOUIae8qQm+XqXGy
	tcynk2mDvrGsxkmlc9plGEzaf//zwcZyUWaJz9VX4/70VWnBSzhJEtvL6TUeFg2qBcyTE8AHu0o
	GfYdrhM43L8XDfvdQMZnphnDAbRRAXdrp3ihlUnw+jY6FTAnC7sas8bW+qreIeyQhS4c7R7cSuo
	y3L7BCiB2c7P6lLbK4TW99iZ7XrPzo50QnTfHGcw0+3Iz5wIMzGYUTCm5C+l1gISo5XyWAzpRE7
	fXrMkT0ZHgtHQgrg2hdg/m0J+uLMFBvUWEyj0b
X-Received: by 2002:a05:7022:6081:b0:137:f4b6:b39a with SMTP id a92af1059eb24-1380672d9a7mr5614612c88.32.1780820464140;
        Sun, 07 Jun 2026 01:21:04 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5489d17sm9439232c88.1.2026.06.07.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:21:03 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sun, 07 Jun 2026 01:20:56 -0700
Subject: [PATCH 2/2] i2c: mux: reg: allow fixing the base bus number via
 fwnode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-i2c-mux-reg-base-bus-num-v1-2-f193b5a8fedc@nexthop.ai>
References: <20260607-i2c-mux-reg-base-bus-num-v1-0-f193b5a8fedc@nexthop.ai>
In-Reply-To: <20260607-i2c-mux-reg-base-bus-num-v1-0-f193b5a8fedc@nexthop.ai>
To: Peter Rosin <peda@lysator.liu.se>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780820459; l=2252;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YQERmjO6hBoH6+GdyySBEbETr2FTBTtGkTU+7Ccv33E=;
 b=GA4/wUnezdHhRk5QO3A6zO2xlwtE/AQK4Dg9ix7np0jTjZ2PELt7nH+Osff1G+z1/gLUEHpv6
 0wUC3LwQGXqChAqwQG6JCLVs4v1MsRgJ3iEr7UXdPd4pvM1DDsWuOsl
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

i2c_mux_reg supports per-channel force_nr through mux->data.base_nr
(when set, the channel-N adapter is registered as
i2c_add_numbered_adapter(base_nr + N)), but the only way to populate
base_nr was the legacy i2c_mux_reg_platform_data path. DT/ACPI/swnode
instances have always defaulted to dynamic allocation, which makes
sensors.conf bus stanzas and other static references break across
boots whenever the i2c-core pool shifts.

Read base_nr from the new "base-bus-num" device property in
i2c_mux_reg_probe_fw(). When the property is absent, base_nr stays
zero and the existing dynamic-allocation behaviour is preserved.

Anchor the per-channel bus number to the channel index (values[i]
== the child node's reg) rather than the iteration counter:

  nr = base_nr ? base_nr + values[i] : 0

values[i] is the channel id encoded in the child node's reg property
(0..n-1), which is also what i2c_mux_add_adapter() receives as
chan_id. Using values[i] makes the mapping deterministic across
fwnode-iteration orderings (some OF kernels walk children in reverse
source order) and across DTS gaps (e.g. a mux that wires channels
0, 1, 3 still gets sane, consecutive bus numbers).

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/muxes/i2c-mux-reg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-reg.c b/drivers/i2c/muxes/i2c-mux-reg.c
index 13da757100fe..5ea59ecb4ae5 100644
--- a/drivers/i2c/muxes/i2c-mux-reg.c
+++ b/drivers/i2c/muxes/i2c-mux-reg.c
@@ -141,6 +141,8 @@ static int i2c_mux_reg_probe_fw(struct regmux *mux, struct device *dev)
 	if (!device_property_read_u32(dev, "idle-state", &mux->data.idle))
 		mux->data.idle_in_use = true;
 
+	device_property_read_u32(dev, "base-bus-num", &mux->data.base_nr);
+
 	return 0;
 }
 
@@ -197,7 +199,7 @@ static int i2c_mux_reg_probe(struct platform_device *pdev)
 		muxc->deselect = i2c_mux_reg_deselect;
 
 	for (i = 0; i < mux->data.n_values; i++) {
-		nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
+		nr = mux->data.base_nr ? (mux->data.base_nr + mux->data.values[i]) : 0;
 
 		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i]);
 		if (ret)

-- 
2.54.0

