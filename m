Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867995;
	b=w1HuH2wDzaSjVGlb1EvVV9cvssYi7ioCYekYmSZC/1fxYpSwdxrpB35AoW03qgw3B7hO
	 wYrx7kXTCLFW+5JdzInQR1eUZqBI2IV5twxk6OTGbQJv832slOB1SRAn5WswxGhr+4gWJ
	 ardzMNep+kW+JXFOg3w6vhYFIXyJjikhkhzywam1lAP8cVrDXIZjjDxTFlsvoaQVU67/d
	 sBdS5+tNTdQOD03LARr3E7V3xrBX5OKNXiPfcJw9XKIcaPxEPCGvSwPahSCl/ztO+TcO4
	 a6E2RZZDQaxZszE599RmpFqXlCCB8ddRRaHBHqqHYtrAVAjfwmXFlPRGMybOi9loT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867995;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=cVMKW7fB8h0SnQR2hp0PSgoEdY8qiS0OoOpSG4SZZnE=;
	b=h7Ft+doaBLRSGZ5+cTHd2se2Vwhb2tvOfW49t5WhJtl9tBB/mjpyhXkkgThVGidCX6pz
	 liUNUXU+5OqJggdWeBepRFs7e0y2ryx1otT98LxxPdPJXxlNtvawQJzcmfQZ/1EUKs4Yf
	 1TAccUOtS2TvpVeIc1EwFflN7ZH/NK87MvVsXZX9u6cuSGMu6ogoVvoZL4H1BoJnf3AZS
	 szs6KYDcI9mEv0grZqD0XCVVg+cSAm3anE2gjlNdk7Vxes3qt4uqIHxz2ToqTQpqQJwq5
	 7zw7aoA5rlJEJoPr5A+1ZAKjDYqXk73gBaA6ItYLLM8OoY/WCu5istmekBAZoSLxbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GDdgrtPS;
	arc=none smtp.remote-ip=209.85.219.97
Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96840606A88A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 22:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96840606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GDdgrtPS
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-91ebf4cd218so48126186d6.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867994; x=1795472794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cVMKW7fB8h0SnQR2hp0PSgoEdY8qiS0OoOpSG4SZZnE=;
        b=b4Ar1QHhfT0FAMUhzMZ/U7s9VvrGMDRQh1MMSuoY1OPqsaqQSIeumfnJ2YyJegYpM+
         XgN+yQsRF53BEs2HUxF89T5hkvIG2XLq/tgb8J/2a05sNpftxzmQ9MV13SRknMA+TX0D
         v8UbBVvL8Rp0NUnUGn87W6WDUcuRsH3Wy4OwnOIyq3t8+5lIjCUlfgSFqkUTT6Cr8etv
         /LfET658Mx9sj+tN29K+3vAk9nTmnu/3jPRhWS9D1gkHz59zn4IMOgVg6Zbp1u2L+58r
         iYdLIbxfTuylXivBZcZ8c/IRammfXIjT5Nk0KO978lRXqPXHEYCXIuhih1QAarsr8SOD
         zrTQ==
X-Forwarded-Encrypted: i=1; AL+hErF2ANWjiLhyFxTea9GB+P5umRQEK9CxIzENNDT0GB1yFUjgogUFe6DEXQmtO1UjgaEvvvwKLi7JM+Qt@vger.kernel.org
X-Gm-Message-State: APuU4Z+SfrLUg2NmYI1z/5XGJAosKLXC+UPDNxMwxZ9bIEIRYWe/sTBp
	UCbUMAl2DOuJGtep5VevFFbWD9w6En+ZU8cAY3QOOBIZxgyvDRBIMm5FE9X3Xfwndr1sTwgvh42
	qQJHNjMt+I/0RET6vtnZdz7Or+cGU++/BOo9apSOFJ0qP57PRBNHJwu6vh7vmrGDKAjbHr/nnEV
	BaUCQi8FCte1yStXs33oVE35gE19JTIOeWj5nXhjHkTn3ezGism91cjh7IYCTT2xOG8MAUHB0DP
	wgU2XXuJ30NdJCdax4JFw==
X-Gm-Gg: AYBFou0nE3gvPeX1epnrv7D6fhUUSihjlGbL//1HTxGtyBIhKRzmSvZurunzQAFkSkp
	Cfvwl+zVedkRbzgOXmdnleqo8nLMoxJgxltLJCk9ipW4JRLxBEYydbqRnKWyI7FhLexWMIwlIUn
	gQMqRnbjdRzr5PsYmzLpb65fhG/fZiaTPfNKgtptRgFYzFwp53vgxDKxKL+gs5tctbLCg5n8XbA
	WUYMa96lGX1Z3MunSmp8XPi9QQXe9ypLDBzEu4uEk6WPUUb/3Dbg1PmADRkv4inj7Zqawx5uogZ
	FodOwAIYa9USb8MFvcKsglciVyR14vUUYdtP8Ru2NrXZwSWr4DjXDKEw8yG68Gc8tWeUlSRgQgp
	f36I1YjXsiK8XGotO8zNDFWLZK1KG11KXRadZMvFPtKBHYj0POJRLsrHAegozSac8Ps1DqU6JLn
	6NduJJah/MQoVDUU2FvtJTbTxofP/bLp3XQdLl3/py
X-Received: by 2002:a05:620a:2984:b0:93e:920c:c00e with SMTP id af79cd13be357-9494ba7e192mr2119129785a.21.1794867993455;
        Mon, 16 Nov 2026 14:26:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7b4f07sm127383185a.12.2026.11.16.14.26.32
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36efb506f29so4051073eec.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867990; x=1795472790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVMKW7fB8h0SnQR2hp0PSgoEdY8qiS0OoOpSG4SZZnE=;
        b=GDdgrtPSd1A//IcT5eYJN7ELhJmZHj6CaZY8PbDuGhKTQ/Ny1TPsXW3dBR1RqTY/q3
         SppgckwO4LBEoMHB0cJEDUXFPEI9d91o1JTXPSogva4ccX8/g5wDzIecehf05QtV3P6F
         X0cVF3ubcRC0or/0ACDYXFYOHMrwDWmo57mTA=
X-Forwarded-Encrypted: i=1; AL+hErHdAyDbif5zTo0cl+iAXeasWDIIdztT0387YKH9uLy6odoXFrPkWiDnI23DF2N1AjHB1GQQPOsWJmao@vger.kernel.org
X-Received: by 2002:a05:7300:7952:b0:381:3b6:6c3d with SMTP id 5a478bee46e88-38103b682f6mr849635eec.35.1794867990199;
        Mon, 16 Nov 2026 14:26:30 -0800 (PST)
X-Received: by 2002:a05:7300:7952:b0:381:3b6:6c3d with SMTP id 5a478bee46e88-38103b682f6mr849591eec.35.1794867989331;
        Mon, 16 Nov 2026 14:26:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 3/9] netfilter: flowtable: retain offload ownership until deletion completes
Date: Mon, 16 Nov 2026 14:25:13 -0800
Message-ID: <20261116222519.1416501-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Teardown clears IPS_OFFLOAD before asynchronous hardware deletion and
hash removal. A new packet can therefore create a replacement flow on
the same conntrack while the old owner still exists. Repeated teardown
can clear the replacement's IPS_OFFLOAD, and the old hardware delete
worker can clear its IPS_HW_OFFLOAD after a new hardware rule was
installed.

The FA route-change reproducer observed four fresh hardware rows but
only one of two connections still carrying HW_OFFLOAD. Two deterministic
KUnit cases also fail before this change: repeated notification releases
a new claim, and hardware retirement admits a new claim before deletion
finishes.

Release IPS_OFFLOAD after both hash entries have been removed. For
hardware flows, GC reaches this point only after hardware deletion is
complete. NF_FLOW_TEARDOWN immediately excludes the old software fast
path. Packets reaching software still use normal conntrack and
forwarding; TCP state and timeout repair run at first teardown. Hardware
deletion may remain pending. Holding the admission bit prevents
overlapping owners.

The delayed release is observable: conntrack dumps may temporarily
report OFFLOAD or HW_OFFLOAD and omit TCP state after a FIN or RST has
returned to the slow path. The status covers ownership pending cleanup
during the GC and asynchronous delete interval, rather than guaranteeing
acceleration. This trades transient reporting for correct ownership
serialization and prevents an old cleanup from clearing its
replacement's status. Document the interval and use packet
captures/counters to identify the packet path.

Include the private lifetime tests and their KUnit configuration here,
independently of the FA series. They cover real hash removal, deferred
hardware retirement, late RCU notification and balanced conntrack
references. The nf_flow_table.config configuration runs these two cases
on its own.

Fixes: e5eaac2beb54 ("netfilter: flowtable: fix TCP flow teardown")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Documentation/networking/nf_flowtable.rst     | 13 +++
 MAINTAINERS                                   |  1 +
 net/netfilter/Kconfig                         | 10 +++
 net/netfilter/nf_flow_table_core.c            |  9 +-
 net/netfilter/nf_flow_table_core_test.c       | 86 +++++++++++++++++++
 .../kunit/configs/nf_flow_table.config        |  9 ++
 6 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 net/netfilter/nf_flow_table_core_test.c
 create mode 100644 tools/testing/kunit/configs/nf_flow_table.config

diff --git a/Documentation/networking/nf_flowtable.rst b/Documentation/networking/nf_flowtable.rst
index d757c21c10f2..b9b444435775 100644
--- a/Documentation/networking/nf_flowtable.rst
+++ b/Documentation/networking/nf_flowtable.rst
@@ -205,6 +205,19 @@ refers to the software offload mode, so there is a distinction between [OFFLOAD]
 which refers to the software flowtable fastpath and [HW_OFFLOAD] which refers
 to the hardware offload datapath being used by the flow.
 
+During teardown, software fastpath lookups immediately stop matching the
+flow. Packets reaching software follow the classic forwarding path, while
+hardware deletion may still be pending. The OFFLOAD status
+bit remains set until hash removal and asynchronous hardware deletion are
+complete, preventing a new owner from racing the old owner's cleanup. As a
+result, conntrack dumps can temporarily retain [OFFLOAD] or [HW_OFFLOAD]
+and omit the TCP state after a FIN or RST has returned to the slow path.
+TCP state and timeout repair still run at first teardown. The transient
+status describes ownership pending cleanup, rather than guaranteeing that
+packets are still accelerated. It clears when garbage collection finishes
+the deletion; packet captures and forwarding counters identify the actual
+forwarding path during that interval.
+
 The flowtable hardware offload infrastructure also supports for the DSA
 (Distributed Switch Architecture).
 
diff --git a/MAINTAINERS b/MAINTAINERS
index c583367c88bc..56212dbc9a0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19396,6 +19396,7 @@ F:	net/*/netfilter.c
 F:	net/*/netfilter/
 F:	net/bridge/br_netfilter*.c
 F:	net/netfilter/
+F:	tools/testing/kunit/configs/nf_flow_table.config
 F:	tools/testing/selftests/net/netfilter/
 
 NETRONIX EMBEDDED CONTROLLER
diff --git a/net/netfilter/Kconfig b/net/netfilter/Kconfig
index 09874c26fd13..f565f87b3a6c 100644
--- a/net/netfilter/Kconfig
+++ b/net/netfilter/Kconfig
@@ -718,6 +718,16 @@ config NF_FLOW_TABLE
 
 	  To compile it as a module, choose M here.
 
+config NF_FLOW_TABLE_KUNIT_TEST
+	bool "KUnit tests for flowtable ownership" if !KUNIT_ALL_TESTS
+	depends on KUNIT=y && NF_FLOW_TABLE
+	default KUNIT_ALL_TESTS
+	help
+	  Test conntrack offload ownership during flowtable teardown.
+	  Require hash and asynchronous hardware deletion before re-enrolment.
+	  Verify that late notifications cannot release a replacement owner.
+	  These private tests are embedded in the flowtable core.
+
 config NF_FLOW_TABLE_PROCFS
 	bool "Supply flow table statistics in procfs"
 	depends on NF_FLOW_TABLE
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 2aa2647ed9df..4c82097cd50b 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -393,12 +393,15 @@ static void flow_offload_del(struct nf_flowtable *flow_table,
 	rhashtable_remove_fast(&flow_table->rhashtable,
 			       &flow->tuplehash[FLOW_OFFLOAD_DIR_REPLY].node,
 			       nf_flow_offload_rhash_params);
+	/* Release admission only after both hashes and async hardware state
+	 * have gone. An older owner must not clear its replacement's status.
+	 */
+	clear_bit_unlock(IPS_OFFLOAD_BIT, &flow->ct->status);
 	flow_offload_free(flow);
 }
 
 void flow_offload_teardown(struct flow_offload *flow)
 {
-	clear_bit(IPS_OFFLOAD_BIT, &flow->ct->status);
 	if (!test_and_set_bit(NF_FLOW_TEARDOWN, &flow->flags))
 		flow_offload_fixup_ct(flow);
 }
@@ -876,3 +879,7 @@ module_exit(nf_flow_table_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pablo Neira Ayuso <pablo@netfilter.org>");
 MODULE_DESCRIPTION("Netfilter flow table module");
+
+#if IS_ENABLED(CONFIG_NF_FLOW_TABLE_KUNIT_TEST)
+#include "nf_flow_table_core_test.c"
+#endif
diff --git a/net/netfilter/nf_flow_table_core_test.c b/net/netfilter/nf_flow_table_core_test.c
new file mode 100644
index 000000000000..378a1c60b50b
--- /dev/null
+++ b/net/netfilter/nf_flow_table_core_test.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+
+static void nf_flow_test_teardown_repeat(struct kunit *test)
+{
+	struct flow_offload flow = {};
+	struct nf_conn *ct;
+
+	ct = kunit_kzalloc(test, sizeof(*ct), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ct);
+	ct->tuplehash[0].tuple.dst.protonum = IPPROTO_ICMP;
+	flow.ct = ct;
+	set_bit(IPS_OFFLOAD_BIT, &ct->status);
+	flow_offload_teardown(&flow);
+	KUNIT_EXPECT_TRUE(test, test_bit(IPS_OFFLOAD_BIT, &ct->status));
+	clear_bit(IPS_OFFLOAD_BIT, &ct->status);
+	/* A late notification for this retired flow cannot clear a new claim. */
+	set_bit(IPS_OFFLOAD_BIT, &ct->status);
+	flow_offload_teardown(&flow);
+	KUNIT_EXPECT_TRUE(test, test_bit(IPS_OFFLOAD_BIT, &ct->status));
+}
+
+static void nf_flow_test_hardware_retirement(struct kunit *test)
+{
+	struct nf_flowtable table = {};
+	struct flow_offload *flow;
+	struct nf_conn *ct;
+	unsigned int dir;
+	int err;
+
+	ct = kunit_kzalloc(test, sizeof(*ct), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ct);
+	err = rhashtable_init(&table.rhashtable, &nf_flow_offload_rhash_params);
+	KUNIT_ASSERT_EQ(test, err, 0);
+	flow = kzalloc_obj(*flow);
+	if (!flow) {
+		rhashtable_destroy(&table.rhashtable);
+		KUNIT_FAIL(test, "flow allocation failed");
+		return;
+	}
+	ct->tuplehash[0].tuple.dst.protonum = IPPROTO_ICMP;
+	refcount_set(&ct->ct_general.use, 2);
+	flow->ct = ct;
+	set_bit(NF_FLOW_HW, &flow->flags);
+	set_bit(IPS_OFFLOAD_BIT, &ct->status);
+	set_bit(IPS_HW_OFFLOAD_BIT, &ct->status);
+	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
+		flow->tuplehash[dir].tuple.src_port = htons(10000 + dir);
+		err = rhashtable_insert_fast(&table.rhashtable,
+					     &flow->tuplehash[dir].node,
+					     nf_flow_offload_rhash_params);
+		KUNIT_EXPECT_EQ(test, err, 0);
+	}
+	flow_offload_teardown(flow);
+	/* nft_flow_offload must not admit another owner during async DESTROY. */
+	KUNIT_EXPECT_TRUE(test, test_and_set_bit(IPS_OFFLOAD_BIT, &ct->status));
+	flow_offload_teardown(flow);
+	KUNIT_EXPECT_TRUE(test, test_bit(IPS_OFFLOAD_BIT, &ct->status));
+	/* Model completed hardware deletion before the GC removes the hashes. */
+	clear_bit(IPS_HW_OFFLOAD_BIT, &ct->status);
+	set_bit(NF_FLOW_HW_DEAD, &flow->flags);
+	rcu_read_lock();
+	flow_offload_del(&table, flow);
+	KUNIT_EXPECT_FALSE(test, test_bit(IPS_OFFLOAD_BIT, &ct->status));
+	/* Re-enrolment is safe now; an old RCU reader still cannot undo it. */
+	set_bit(IPS_OFFLOAD_BIT, &ct->status);
+	flow_offload_teardown(flow);
+	KUNIT_EXPECT_TRUE(test, test_bit(IPS_OFFLOAD_BIT, &ct->status));
+	rcu_read_unlock();
+	rcu_barrier();
+	KUNIT_EXPECT_EQ(test, refcount_read(&ct->ct_general.use), 1);
+	rhashtable_destroy(&table.rhashtable);
+}
+
+static struct kunit_case nf_flow_lifetime_cases[] = {
+	KUNIT_CASE(nf_flow_test_teardown_repeat),
+	KUNIT_CASE(nf_flow_test_hardware_retirement),
+	{}
+};
+
+static struct kunit_suite nf_flow_lifetime_suite = {
+	.name = "nf-flow-lifetime",
+	.test_cases = nf_flow_lifetime_cases,
+};
+
+kunit_test_suite(nf_flow_lifetime_suite);
diff --git a/tools/testing/kunit/configs/nf_flow_table.config b/tools/testing/kunit/configs/nf_flow_table.config
new file mode 100644
index 000000000000..7f2aa55190c2
--- /dev/null
+++ b/tools/testing/kunit/configs/nf_flow_table.config
@@ -0,0 +1,9 @@
+CONFIG_KUNIT=y
+CONFIG_NET=y
+CONFIG_INET=y
+CONFIG_NETFILTER=y
+CONFIG_NETFILTER_INGRESS=y
+CONFIG_NF_CONNTRACK=y
+CONFIG_NF_TABLES=y
+CONFIG_NF_FLOW_TABLE=y
+CONFIG_NF_FLOW_TABLE_KUNIT_TEST=y
-- 
2.53.0

