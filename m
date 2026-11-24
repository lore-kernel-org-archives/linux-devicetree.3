Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495951;
	b=zDVvD3LXqVldG2Lh1JUGQ0OzJb0GWcgH5SjR4djKKLIpgbz8u2hz3xi7Q9nS4tO1to4B
	 9o053CJt5UBNlVUCkJaWrx2R0voc7w6O0LPlLjRaigJ0UvSJK2q87iGgQ20X0BHUru3jo
	 0Nc+GjBlPXuJFFk8fu1iBAFajHPZsPkwmTgnwgXCgE7DPCegKYa5AfMocn0zS6ltyDmWn
	 Tkel3M2rheYlI57LcZNmreRPpwod1r1tEl1E5ue45CRapCnS8KrDu6Dp/yE03vpyQDhw9
	 twwn3oMtyd3ywt8fyfJEooUpv4PKxpsZBJtYfIvtaOutBe/7iqpUYyxGxX4SY14WACA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495951;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=/2sPhb+dBfJo/CBZCdUXXP3d9QURixSTo8LXz8G5LaA=;
	b=rChF6PCYj/WEuAwUc4Jvrg60Dq0kUj3Omz7dVewW61as1Ecpe8+Rpvm0MjF1PM7UoWD6
	 XWskUM372UTnS8gSDmm1euIyPHC0pmdXJ/8fkvsReLbt5R9OG+1WVg3N8Z61e+wKV6BBT
	 R/2Qae92Wn3vj8xR00aIcevls9lJEbWLDUEnK4nf/OIhLUd6UoQIZ/BnU1p6G5EWb4ZzC
	 +xisOoc4X+Z2TqsKexnI5WukNN8E1nLKYkwNkA1fsTJP4nNeYj0DqOYTydztVoKu/BT12
	 LcckBy9Lh66ouu9HwrcsTzhxwLMPTywaWoDV7PEj6ykBPD7KQq1k0qHLvHV+fIQRb/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mJxCq8on;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184EE606A322;
	Tue, 24 Nov 2026 04:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184EE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=mJxCq8on
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=/2sPhb+dBfJo/CBZCdUXXP3d9QURixSTo8
	LXz8G5LaA=; b=mJxCq8onky1qkUoPC1POf+p/bwXuyoKRSTMaUAsjR4X4bz78Lr
	ja0hmRR5TCQ/1lz4/5JhzLi+ptublOnExj0Wov29Mrshi+mkKd2aS2k+oDGVz+Vr
	eKs3BrzrCLtBYj3wAwuQkFiqE7JgfTgIHEcBQNSzsnLKIvlQ1KKXM8NJU=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.185.179])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAXpEgEGAVrKRnwAA--.2129S4;
	Tue, 24 Nov 2026 12:52:23 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Thinh.Nguyen@synopsys.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 2/3] usb: roles: look up role switches attached to a graph endpoint
Date: Tue, 24 Nov 2026 12:52:19 +0800
Message-ID: <20261124045220.595001-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261124045220.595001-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAXpEgEGAVrKRnwAA--.2129S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fZFy3ur1DCryDZr1kXwb_yoW5KF4fpr
	yakF1Fvr4DJFya9w4fGa1UAFWrWr4fGF4UJF4xt3WfC3Z3t3yrJr18ta4ayr1UCanIgw1Y
	v348A3409a4DA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU
	snYFDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREBB2sElFst2AA0s3

usb_role_switch_get() and fwnode_usb_role_switch_get() look for a switch
on the caller's parent device node or through device_connection.  That does
not work when one controller exposes a role switch per connector endpoint:
the switch is registered against the remote graph endpoint and the
consumer, the connector, has no phandle to it.

Add usb_role_switch_at_endpoint(), which walks the caller's OF graph
endpoints and matches a switch registered on the remote endpoint, and try
it after the existing parent lookup.  A switch that is described by the
graph but not registered yet comes back as -EPROBE_DEFER, as the rest of
the role-switch API does, so the caller retries instead of concluding that
the connector has no role switch at all.  There is no behaviour change for
existing users: if nothing is registered against an endpoint the lookup
falls through to the previous paths.

This is needed by DWC3 designs where two Type-C receptacles share one High
Speed data bus.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/usb/roles/class.c | 45 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index edec139b68b5..ee186d542a10 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -157,6 +157,47 @@ usb_role_switch_is_parent(struct fwnode_handle *fwnode)
 	return dev ? to_role_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
+/*
+ * Look up a role switch registered against the remote endpoint of one of the
+ * caller's OF graph endpoints.  This is how a connector endpoint that shares a
+ * USB data bus with another connector (for example two Type-C receptacles on a
+ * single DWC3 controller, selected by a GPIO mux) finds its own role switch.
+ */
+static struct usb_role_switch *
+usb_role_switch_at_endpoint(struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *ep, *remote, *parent;
+	struct usb_role_switch *sw;
+	bool available;
+
+	fwnode_graph_for_each_endpoint(fwnode, ep) {
+		parent = fwnode_graph_get_remote_port_parent(ep);
+		if (!parent)
+			continue;
+		available = fwnode_device_is_available(parent);
+		fwnode_handle_put(parent);
+		if (!available)
+			continue;
+
+		remote = fwnode_graph_get_remote_endpoint(ep);
+		if (!remote)
+			continue;
+		sw = usb_role_switch_match(remote, "usb-role-switch", NULL);
+		fwnode_handle_put(remote);
+		/*
+		 * ERR_PTR(-EPROBE_DEFER) means the switch is described by the graph
+		 * but not registered yet: pass it up so the caller defers instead of
+		 * concluding that this connector has no role switch at all.
+		 */
+		if (sw) {
+			fwnode_handle_put(ep);
+			return sw;
+		}
+	}
+
+	return NULL;
+}
+
 /**
  * usb_role_switch_get - Find USB role switch linked with the caller
  * @dev: The caller device
@@ -169,6 +210,8 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(dev_fwnode(dev));
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(dev_fwnode(dev));
 	if (!sw)
 		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
@@ -192,6 +235,8 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 	struct usb_role_switch *sw;
 
 	sw = usb_role_switch_is_parent(fwnode);
+	if (!sw)
+		sw = usb_role_switch_at_endpoint(fwnode);
 	if (!sw)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
-- 
2.53.0

