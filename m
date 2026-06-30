Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895873E5EEA
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812829; cv=none; b=SDYbWeNyo6CvjZSsezrbPHb34DN2tiUdzInj/T1TVFnzAy98yaHTvt4+cbKxHAoTHpxM5q6NICGpkRkAwYUny0hkE4cIPqmhO4IRsZ5lNJ/O9S+1SWB70Xpka6dvowYlo/Isijpd/WZFj9wG5myql1BIXLt5Q9IfwmoBullpBGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812829; c=relaxed/simple;
	bh=1lAuX1dOvob5WlUR4elT7eSNAOc5CKgC3zoG2VGlYfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idB48qZdQxQyLNJKGyDHxTSC4cWFeHlH7VrxipfrqpJC6ZAnUzOxTrQrgno1/E+WJrFZ2eSz/siYHLa5U5uoLhVnYA5YisrGMi6dZ9pTR4o0w+LBK8lrWHQEemM+qBhsWgYEmmWtoPtDhf0+uxvIS8WyvKQvi+VyascqN1h5QDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=RZibmz01; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RZibmz01"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c9cb97e178so23150515ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782812826; x=1783417626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1mhPayeB7vwAFK9b1yiuy8iVzM6luMZwkJqwu4SqsU=;
        b=RZibmz01sROkx0MfvuAmXtejUYBv9PEPuJokOkHOfTPOSlQ1hjvCmtrxV4nmOTKNO4
         1dxob4G30I5TgEhC1QQLeKwJAf0nf8zXxTVMyWmj5lnwueODb2t+1Kz4DJvRV/1doK2j
         iP8lv3WF4MESMkCol70OrhHNjQPsYrzp0bGOciTaEnDA36uxS0Ms+ogWic6Lp43cWtZv
         ANyFoHjLiK4OBKuMYmJKMWlbLppu52IezMtkaHrujzYo1c9Otj6IpCmC8K+wEqzkxaEd
         ZMzwUk5AMF+GqDtAw5RccAP71ytiKYUERtptkNzlmxyVWLpj6lkmBCHdz6DNnSyZyO/u
         +5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782812826; x=1783417626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q1mhPayeB7vwAFK9b1yiuy8iVzM6luMZwkJqwu4SqsU=;
        b=om7GrhNaYof3DV1K9aNsA1z1W48e+j/5pGbhYUa0Hz4/jEWz6n2HNenimE/F7i6r7E
         DZOnj2R47T+AKw6a1vOq4vGxnrZcFRl348uNn1jb5He7ojtlT4vhr9oH63rP+54MQmCC
         0gf3GcfhLQJNkuJFhivzA3PykpPrw7tE9CRCcmAP64+3JouKkttj56FAmGDFDkh6Ho++
         OQIeHM2w4Hgrz3Bo+xK+yl5uMEznjgDljgh78Fuf5iDQ0XkIF0tocVZD5Bl62O38y1Q9
         H/DFmmJt9dUp9PWdbEUhCv8Ynp+Qds9EjAD5Cc99yT50Pud9rcilCI3BxmrmKOzvtQkb
         VD/w==
X-Forwarded-Encrypted: i=1; AHgh+RoiTd2FFqqD4SMTJOM0YfFL4PBVtMGuyfP2xhAkfmu3Wlc3snpxZR8MhJfiwMU5PBe0ZPAPiXo4SrfZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwANsxOqQSJrSxOS9IWK6envs8IGiMiFEkMFbM9K9e8PSwHr4yX
	fR2xQ4RJmVJjSiXXDa58GGnfbtZ53Kkw9Jax7cSELLobtGxCVSfTjgbx8Yx24lvweAjZ6h6/ukW
	ogW5du6C0C3tFVHYeGBnsgCmkuPk9HTSo4rXd0o4+i/gpzdEzvlktMhgd73nhBzGP/7Fg0eFSxV
	vlVUfEkn8ew1IROzOpDRi+PR/2bt64WECyEpy8MlipHCKlle16nLd8cg==
X-Gm-Gg: AfdE7cnEr9h8yT66fNZ4x+7xhucLidihykkTtANVf6bSw/uz8ETJd+zc6+1zapBowJ4
	9g22FyDMCTQAyMRtKfd/mwFEC/rWv00cYu/PLtd5EHWvka0Xeya+HdvzzXc8oX0+h7GKt/ORuWi
	JMD7DWwojybItwn0BJcjmc2VWbPSunONg1dC7ZVct7F1ae7O21Hc6Pl0nTDjNCxQs0LcNJ3y9D9
	RNfygPZLfV/bWI7WtudRlusgPlmOiSm2a2HEnUAmXBVGjV16hSkbHqbLM5+fGNWmgcP5ULNfqal
	0ix9unhPOCWtpIAeVPudbXLhGQ4E7sQOIyhTY8/+b0PDTCJ67v3GfmJqRoRFx7oZOcZi2E8mizu
	lBSvWHn9TNyLJcFXmIXVzrC4uT1nambHhSJNeuzD8jA363VL8Rd9sEcujGgnBV/8g2m47cx8EzB
	mucrKr6dFC46sxkNgcOv8muQ0o/Ri4cJA=
X-Received: by 2002:a17:902:d2ca:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2ca2d56543dmr23326695ad.18.1782812825774;
        Tue, 30 Jun 2026 02:47:05 -0700 (PDT)
Received: from EricL-ThinkPadX1-TW.local ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37c87bb8sm10144675ad.30.2026.06.30.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:47:05 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 30 Jun 2026 17:46:27 +0800
Subject: [PATCH RFC 04/12] rvtrace: Pass struct rvtrace_path_node to start
 callback
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-4-c9c1ffc64e4b@sifive.com>
References: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
In-Reply-To: <20260630-dev-ericl-riscv_trace_support_v3-new_sifive-v3-v1-0-c9c1ffc64e4b@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>, 
 Eric Lin <dslin1010@gmail.com>, Eric Lin <eric.lin@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>, Vincent Chen <vincent.chen@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782812801; l=5312;
 i=eric.lin@sifive.com; s=20260630; h=from:subject:message-id;
 bh=1lAuX1dOvob5WlUR4elT7eSNAOc5CKgC3zoG2VGlYfI=;
 b=PARNFRWmdV+hB1v3H2XemPeF/EkHqwMQ8r/pB59m0oP1gyQQ3yYXpQCsIuW7KshBvhM9xGAWZ
 SlzwX8msXa1CckSJJMhBxH+q5aGwJ1GgxwvfwQaS6lNJmy07sUyzQ5W
X-Developer-Key: i=eric.lin@sifive.com; a=ed25519;
 pk=RLPQN6uNJ1cSM8GhP+L++2j3pf5ohznFbkNdwIO1XDw=

Routing trace data from a source to an output component requires
configuring the connections between components. The mechanism for this
configuration varies between hardware implementations:

  - Standard (ratified) RISC-V trace configures routing at the
    receiving end. For example, a funnel uses the trFunnelDisInput
    register to control which source input is accepted.
  - Pre-ratified hardware (e.g., SiFive) configures routing at the
    sending end, selecting the output destination by setting a bitfield
    directly within the current component's control MMIO register.

To seamlessly support both ratified and pre-ratified data flows,
component drivers require full path topology information (i.e., the
component and its connections) when starting, rather than just the
component itself.

Update the rvtrace_driver->start() callback to accept a
'struct rvtrace_path_node' instead of a 'struct rvtrace_component'
so that component drivers can access the node and connection
details required to program their specific routing registers.

Co-developed-by: Nick Hu <nick.hu@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 drivers/hwtracing/rvtrace/rvtrace-core.c    | 12 ++----------
 drivers/hwtracing/rvtrace/rvtrace-encoder.c |  3 ++-
 drivers/hwtracing/rvtrace/rvtrace-ramsink.c |  3 ++-
 include/linux/rvtrace.h                     | 14 +++++++++++++-
 4 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/rvtrace/rvtrace-core.c b/drivers/hwtracing/rvtrace/rvtrace-core.c
index 51546cbcc6ad..12ffc6917c70 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-core.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-core.c
@@ -501,12 +501,6 @@ void rvtrace_unregister_component(struct rvtrace_component *comp)
 }
 EXPORT_SYMBOL_GPL(rvtrace_unregister_component);
 
-struct rvtrace_path_node {
-	struct list_head		head;
-	struct rvtrace_component	*comp;
-	struct rvtrace_connection	*conn;
-};
-
 struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path)
 {
 	struct rvtrace_path_node *node;
@@ -625,17 +619,15 @@ static void rvtrace_release_path_nodes(struct rvtrace_path *path)
 int rvtrace_path_start(struct rvtrace_path *path)
 {
 	const struct rvtrace_driver *rtdrv;
-	struct rvtrace_component *comp;
 	struct rvtrace_path_node *node;
 	int ret;
 
 	list_for_each_entry_reverse(node, &path->comp_list, head) {
-		comp = node->comp;
-		rtdrv = to_rvtrace_driver(comp->dev.driver);
+		rtdrv = to_rvtrace_driver(node->comp->dev.driver);
 		if (!rtdrv->start)
 			continue;
 
-		ret = rtdrv->start(comp);
+		ret = rtdrv->start(node);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/hwtracing/rvtrace/rvtrace-encoder.c b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
index d189819aecf7..f0a4ac46b6a9 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-encoder.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-encoder.c
@@ -11,8 +11,9 @@
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_SHIFT	4
 #define RVTRACE_COMPONENT_CTRL_INSTMODE_OPIT	0x6
 
-static int rvtrace_encoder_start(struct rvtrace_component *comp)
+static int rvtrace_encoder_start(struct rvtrace_path_node *node)
 {
+	struct rvtrace_component *comp = node->comp;
 	int ret;
 	u32 val;
 
diff --git a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
index e4b6f0547245..7aa525ac0f75 100644
--- a/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
+++ b/drivers/hwtracing/rvtrace/rvtrace-ramsink.c
@@ -43,8 +43,9 @@ struct trace_buf {
 	size_t len;
 };
 
-static int rvtrace_ramsink_start(struct rvtrace_component *comp)
+static int rvtrace_ramsink_start(struct rvtrace_path_node *node)
 {
+	struct rvtrace_component *comp = node->comp;
 	int ret;
 	u32 val;
 
diff --git a/include/linux/rvtrace.h b/include/linux/rvtrace.h
index 9f1afcfd83e6..079fe16807d3 100644
--- a/include/linux/rvtrace.h
+++ b/include/linux/rvtrace.h
@@ -281,6 +281,18 @@ struct rvtrace_path {
 #define RVTRACE_INVALID_TRACE_ID	0
 };
 
+/**
+ * struct rvtrace_path_node - Representation of a node in the trace path
+ * @head: List head for linking nodes in the path
+ * @comp: Pointer to the trace component at this node
+ * @conn: Pointer to the connection leading to the next node (NULL for sink)
+ */
+struct rvtrace_path_node {
+	struct list_head		head;
+	struct rvtrace_component	*comp;
+	struct rvtrace_connection	*conn;
+};
+
 struct rvtrace_component *rvtrace_path_source(struct rvtrace_path *path);
 struct rvtrace_component *rvtrace_path_sink(struct rvtrace_path *path);
 struct rvtrace_path *rvtrace_create_path(struct rvtrace_component *source,
@@ -324,7 +336,7 @@ struct rvtrace_driver {
 	const struct rvtrace_component_id *id_table;
 	size_t			(*copyto_auxbuf)(struct rvtrace_component *comp,
 						 struct rvtrace_perf_auxbuf *buf);
-	int			(*start)(struct rvtrace_component *comp);
+	int			(*start)(struct rvtrace_path_node *node);
 	int			(*stop)(struct rvtrace_component *comp);
 	int			(*probe)(struct rvtrace_component *comp);
 	void			(*remove)(struct rvtrace_component *comp);

-- 
2.34.1

