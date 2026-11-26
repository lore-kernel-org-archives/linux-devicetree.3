Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684047;
	b=NPbruP2SXNX9jyZItOnNiegQIZHkub1US70GvNhvy+XbOdxeqvWhtwavn0St0YfaU2eg
	 WR4y0zPwZsFbDATDZ/wHKKvJRmrhFDzy2kq+jXiDQvTvdN08pS69McbeGHA2uAi4USP8A
	 kptZQ/5Zr5vAQytK4WFP7iTBCHGUqYqT0v2fBamh9oKdqvQN3YrvQFszHIRv1BaHEV0qB
	 9LlKYmRzRlEAuzm08g22FPmD+9FZfvf7KmCjJHiKueLwzJKyekfp4A34YsmZSk7/XlADY
	 M3AwCAM7ygyT4uF8KXzhTEEXC790o9FcWZrK5N44FNWfoMgdAJ0M252zT6tYWlmYDWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
	b=qLMmHBSjMxGvUhobsKjwlOdBXnw7/uur34ELshG82/wR1KEqHQ26mqlfjEy+W43Ooqo9
	 Ysz+7CfhFNQwrqPc+EradYwgxfdGWNw59ICdd1R+gTCGIPy0jq/gsifhL6nHB8BG2qR7z
	 Iu7ZRYvo44ZDqryXa9NQRKxvIIWO8PD9QcUN2JUpgsuiROKQjzBeNdQySsmyXce/cSRBm
	 4Wk7EZQFzmOwwfUEbtBUls+ISLxFv5Rn+jveF5+BVzFZ08ops/+3CfUSa2tXLIFfVN755
	 vRAeE2ppUYruYPnXtePsMq6VndquuoTD57q3IejqDlODFU41Nk7u3oT9WEPAGjnMR0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=hHv8mFAz;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9914606A6AA
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 09:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9914606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=hHv8mFAz
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b5786e099cso5347498c88.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 01:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684046; x=1796288846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=hHv8mFAzvJzoEeNvXlYjWXgKGgYVtMVe6lz4ToGV3M23A0dGYbOcMoOq2FlEY1Afma
         aRbtxgPQ2yFl/IgVHp0xa8WbU6iqzdeCXMcn046JHmVg6RQCRzb+hitIM1yf+pmk8ptd
         qwm3VaH6LaS8t5/FRD1JkmwLGAcPJfl21gTVMGonL4PN5kXHfmbhWNbuEDaZO63eyZou
         BudppUrg5MkNe5G9OWrc13IR6vVRcrmeuD2TNUZvBi1cM6iBigibF0sdhM3CSXndh7gn
         KsTblrHEc71h3xjG5xX5BkQVqTiSaSqYEvJ7yQBChlDqE3T7Xk1s7Uc4vxKOY3UtzJ3j
         WUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684046; x=1796288846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zePae+AgwsxBTIqUJW1YaRElDL4kYS7QZ0ec/q5slnw=;
        b=fvNGLDyhYeMQeAZ0ju7JwL2hQS/qWxPI0zry0pULpxjAYffut+XYTSBc86kj/9Xtnw
         kpdnUMmwvXHmLubdTg48Xg3+jX5Mscid4NNdUwynY9G0g8z9Egvdtq7lxvW39BHmeyqe
         jW04EYez0FGrh7Uw2T0d582R3uDmwaQ3zM0Wf8ci1DfT7kPASGxDy10wR87t5wnEwU/q
         XHZInothVDJKPWMyTOPdQ6XH8kwiKAesDHOcs5q/xB3pxQVrLQc2JL44LWz9GER/Sy/B
         kRDOXDk95Oani8qGg15lTdLimDnfkSspy5951VKGXM8BEaIKnTTPzCXJnjjj0nsr6MEO
         1vdQ==
X-Forwarded-Encrypted: i=1; AL+hErHxSDeQ2qbQ4Y31aaIXd51cqIgntb4CEhMf4H+JWua3SxbdTWmuEetH84I0jPYlNTQqlx2D42RBmJH2@vger.kernel.org
X-Gm-Message-State: APuU4Z/ciUT4HTx7s9d2Izr9S88xBKH48zuWsC8cRXP6FvuAgVwOo7Tj
	aL10pEAo63bsgLdReAL6+3h3mg5nMqsobfjb1CcD4Sb64uCQEv6D/eeLPzCKVuh3h/4SAFAL8ED
	K9xZcbUP6xX+noKfGsW6PV8f6Rufminz2uNjgEzMJoHBiB+3JAOIhNJJqUvi4FqSBEJigEqHpxa
	xjqCTtwXopUdIfxmihu2O5E7Nwr7+EUHpVSv0lzAkEkpWl66bj3A==
X-Gm-Gg: AZFdTZdGJPxWIOBaM9GVXuvjaTlbgKRde8SR+vLXcANGu3aNF/mP1zRWDixAA3a5uW7
	lkLEHWVaeS4M7kIk3c1HTQxjfkdrD16rMeWxoVhy2q3pWPD+EN9TUrNuCSWS6RnprmnwKemdSo1
	LKxVmXzeeVT5uegKHzVQF8cIf4hutEyzDhleOC8pob0wHpnHL6riX6C4do5zx/cMjVLO8VZVNXH
	yxhSbjRNA7TupQRiVh98W+0WrgMZJJMTVEyfNv9aXSG4Qk++HXtvSjLaNmXMed7s+6xyLty4SbV
	olr4jnIxOD6/Ft2wws5StoJbsakn4dzftYgdorOrlKwQFy35AiQS08XZBbr9h2R8TiAPiCcpSt1
	d5wmLCkjSIg3t5jP9AN5TELLS0VOWZHg6vWghuqp9Ql4a8f1H+BmD68MHCl9/cNfXiAXnx++lWb
	9pidc+zK/GZ+clBYPt0SBzBW98WePVQwTB6EFrw6wgBd5XqquRLS4PfTvHOuiFsV7STm5Wvyj5Z
	AxVnvnKZ7ROiN70K2prlCxEKXx8YH+kz/PILNkH8YW3tRS0g3pWcobJmojA7VPxQ5yUKPplwSfu
	JopXEfT2e0wg0Qqn4O90OvC5H7JZxXr4LUyq1/5vlt5A
X-Received: by 2002:a05:7022:b0c8:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b5569225afmr18971488c88.34.1795684045709;
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:25 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:10 -0800
Subject: [PATCH 04/10] gtrace: rvtrace: Add pre-ratified encoder support
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
Message-Id: <20261126-send-preratified-trace-v1-4-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

From: Eric Lin <eric.lin@sifive.com>

Add pre-ratified version support to the encoder driver. This allows
pre-ratified trace hardware to leverage the gtrace driver framework.

The pre-ratified encoder has a different register layout for the
source ID: the SRC field width (nSrcBits) and value are preset by
hardware in teImpl, while offset 0x8 is the read-only teImplExtra
register rather than trTeInstFeatures. Add rvtrace_comp_is_v0() and,
for pre-ratified encoders, derive srcbits from teImpl and skip
programming the trTeInstFeatures source ID fields.

Another difference is the encoding of the trTeInstMode field,
so set the corresponding "Optimized intruction trace" for
the pre-ratified encoder.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/rvtrace-encoder.c | 42 +++++++++++++++++++++++++-----
 drivers/hwtracing/gtrace/rvtrace-v0.h      |  4 +++
 drivers/hwtracing/gtrace/rvtrace.h         |  6 +++++
 3 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder.c b/drivers/hwtracing/gtrace/rvtrace-encoder.c
index 1f06b1a2b412..0a23c78c0caf 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder.c
@@ -11,6 +11,9 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include "rvtrace.h"
+#include "rvtrace-v0.h"
+
+#define RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT	0x7
 
 #define RVTRACE_COMPONENT_CTRL_ITRACE_SHIFT	2
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_MASK	0x7
@@ -95,6 +98,23 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	if (!priv)
 		return -ENOMEM;
 
+	if (rvtrace_comp_is_v0(comp)) {
+		/*
+		 * Pre-ratified encoders have the SRC field width and value preset
+		 * by hardware in teImpl. Offset 0x8 is the read-only teImplExtra
+		 * register rather than trTeInstFeatures, so don't program it.
+		 */
+		val = gtrace_read32(pdata, RVTRACE_COMPONENT_IMPL_OFFSET);
+		priv->srcbits = (val >> RVTRACE_V0_IMPL_NSRCBITS_SHIFT) &
+				RVTRACE_V0_IMPL_NSRCBITS_MASK;
+		if (priv->srcbits) {
+			val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
+			val &= ~BIT(RVTRACE_COMPONENT_CTRL_INHIBITSRC_SHIFT);
+			gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
+		}
+		goto out;
+	}
+
 	ret = rvtrace_encoder_set_format(pdata);
 	if (ret) {
 		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
@@ -123,6 +143,7 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 			priv->srcbits = srcbits;
 		}
 	}
+out:
 	if (!priv->srcbits) {
 		dev_warn(&comp->dev, "cpu %d trace will not carry source id\n",
 			 pdata->bound_cpu);
@@ -141,13 +162,15 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	int ret;
 	u32 val;
 
-	if (priv->srcbits)
-		rvtrace_encoder_set_srcid(pdata, priv->srcbits);
+	if (!rvtrace_comp_is_v0(comp)) {
+		if (priv->srcbits)
+			rvtrace_encoder_set_srcid(pdata, priv->srcbits);
 
-	ret = rvtrace_encoder_set_format(pdata);
-	if (ret) {
-		dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
-		return ret;
+		ret = rvtrace_encoder_set_format(pdata);
+		if (ret) {
+			dev_err(&comp->dev, "failed to set format %d\n", pdata->format);
+			return ret;
+		}
 	}
 
 	ret = gtrace_enable_component(comp);
@@ -159,7 +182,10 @@ static int rvtrace_encoder_start(struct gtrace_component *comp)
 	/* set mode */
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
 	val &= ~(RVTRACE_COMPONENT_CTRL_INSTMODE_MASK << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
-	val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	if (!rvtrace_comp_is_v0(comp))
+		val |= (RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
+	else
+		val |= (RVTRACE_V0_COMPONENT_CTRL_INSTMODE_OPIT << RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT);
 	gtrace_write32(pdata, val, RVTRACE_COMPONENT_CTRL_OFFSET);
 
 	val = gtrace_read32(pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
@@ -204,6 +230,8 @@ static int rvtrace_encoder_stop(struct gtrace_component *comp)
 static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 	{ .type = GTRACE_RVTRACE_ENCODER,
 	  .version = rvtrace_component_mkversion(1, 0), },
+	{ .type = GTRACE_RVTRACE_ENCODER,
+	  .version = rvtrace_component_mkversion(0, 0), },
 	{},
 };
 
diff --git a/drivers/hwtracing/gtrace/rvtrace-v0.h b/drivers/hwtracing/gtrace/rvtrace-v0.h
index 0681405fa414..5abdc4788f64 100644
--- a/drivers/hwtracing/gtrace/rvtrace-v0.h
+++ b/drivers/hwtracing/gtrace/rvtrace-v0.h
@@ -24,6 +24,10 @@
 #define RVTRACE_V0_IMPL_HAS_SBA_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_SBA_SINK_BIT)
 #define RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_MASK	BIT(RVTRACE_V0_IMPL_HAS_FUNNEL_SINK_BIT)
 
+/* Number of SRC bits preset by hardware in the Nexus messages */
+#define RVTRACE_V0_IMPL_NSRCBITS_SHIFT		24
+#define RVTRACE_V0_IMPL_NSRCBITS_MASK		0xf
+
 struct rvtrace_v0_comp_features {
 	bool has_sram_sink;
 	bool has_atb_sink;
diff --git a/drivers/hwtracing/gtrace/rvtrace.h b/drivers/hwtracing/gtrace/rvtrace.h
index b0cf2e1d875f..308de9fe39ae 100644
--- a/drivers/hwtracing/gtrace/rvtrace.h
+++ b/drivers/hwtracing/gtrace/rvtrace.h
@@ -72,6 +72,12 @@ enum rvtrace_component_impid {
 #define rvtrace_component_mkversion(__major, __minor)	\
 	((((__major) & 0xffff) << 16) | ((__minor) & 0xffff))
 
+/* Pre-ratified (version 0.x) components are identified by major version 0 */
+static inline bool rvtrace_comp_is_v0(struct gtrace_component *comp)
+{
+	return rvtrace_component_version_major(comp->id.version) == 0;
+}
+
 /* Map a RISC-V hardware component type to the global gtrace type */
 static inline int rvtrace_type_to_gtrace(enum rvtrace_component_type type)
 {

-- 
2.43.7

