Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220795;
	b=o25IbLz0zmpwBRl48Qxl3In68os9OLu0uWs35I3be3gKPY2/PQsmIf/GiKPyasME6NAw
	 +YdKVwQ1pj2zbYa2pUCU3sV44FvCL51Dm07x+EXB09ISDBiwuy4LdA1CxykLHH35LB7ls
	 T6OIMuTr8I/wRxBWu/JmkpHbiFLuIgip28Q7M5phwuZabfqE5cj5faPR0arJ7dHHXfnhO
	 ziTtWbIjdvlKL61DMIApNc1dkZhL+dRod+gtdoOWXhayQsOXEiAs/emBy4Gvdjzn7A694
	 PGxZih/tHVO4JZJmUNM6X6XeBDQVhJo3hc9Biq4OrOsnh3Q8sxnZigP9+6ydmxyhR+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
	b=2fv5CEo3r902dntmbOX1hKciw2JGxyGfXjZ7vYnlU+qXF0WiegATOcXvrWTOQqqtJmkl
	 gBpET3XKz7kz2//kS3pkElSZQBWATT0kd1NrjE5xdr+ylfb+zwevhPG2wVTqYzjcjN79x
	 B/TpEYIBFLlxf6PUn9vKmf/IJjn7eNIsCzr4zJ/WnwPbQOwgX5/vgpIykCgg0jzVWPYO0
	 B5pXPzVRxcAZqSAWmBQ7bleF8u0DhYVesLUagchYJaDoR8lFIgdQTBvHlir5OnLXEv5uS
	 fWKriluhEeCwPdXXYxrovW4XAX5ZhAafQi0Clq59kV0vBxP5RaETIDjsPmWdI0WF8TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SjMIO0iv;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABB5606A6A3
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABB5606A6A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SjMIO0iv
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso844086a91.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 16:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220793; x=1795825593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=SjMIO0iv4crfyKOx6thBXKWprskCLQMZkF77RGRXiSWHYi9URnzk3BpXfwZj85NG/W
         +GTaXNSXZKrSNy4DmvWN/ELnVKTjrwlwlVc9mwbgf9lMtvNAdew84lROrN8KIgsx6oxf
         9l3uTQAN5GXDKV4e4Cd5lsQyi+UH19q99OQrLUU253FUNPwTkpxWIYaNpi+laXB4Q52u
         51JGoK7zvSg/3AUj33Jc/7u6PgqqSatta22bpGu3TXED/gtE0JDQqr7F3oNuTPmrTmKa
         thLgkl0okq2KdKbLnaQU9GgnFlNBwR3h8eJlNzu5VQV20Q05vuSx0Uid+2tM0Z+MLyiQ
         R32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220793; x=1795825593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibwDa8hDIqWz6KJ5BGcs/jqLMptJO7R0iDPAOR5Uhsk=;
        b=K0YWX+Nj36rroGlFjfVrBSWnRe/dX2Hh5Vd7ryJfHGJ3hrWRB0A5Pq45Jx6Q42W64u
         Eo4FnNlxpxGt6MhI0ncDftFvkVdKx/oMxVxvnu2E2O95MsDHuDOiB+ObDG+YnmBZjvFv
         gsXjqAMIIiZiFABPLjXWq20Tx0e++f7v+dmQE/sSIric5p9WFonAl4HArEJin1FKb5dV
         k+JvcgpkxTvDFjt3dygsODPyq9mwdgbZerBGY9YuPsBb1OxxlT6PovOCZUHm6Wjwj9+c
         j8FNw/T6yr7M3B4GS2ViqJp+E1G0lBROaEgjriciWTgMgIMTLhcDRSUs1aov0o3rJaXv
         VAKg==
X-Forwarded-Encrypted: i=1; AL+hErGZYlPm4H1uU48KPUbbdiufRfzDUMt9XJ4rLbso7mWiXyyN3Vi3r9P7mxMWlyQPrJY18tb4Y9dRJqx/@vger.kernel.org
X-Gm-Message-State: APuU4Z83xtLlmT1XR9DESAD5Pd2FhdFQ4quBKrIQrkbKv+mjeLZeFtIg
	Ef/XaiGMhiE/FDxGpWIWheHF30gO8PW8RwLBovt91uwWQykz5GcD7dKv
X-Gm-Gg: AZFdTZfntmlMJUr5yo3r+WAr20Lli1bOYiEJ7Y8mKLu5OsMRqV6NiiweuPr9EhadUZk
	atGNu24aH+zekjNbJ4F/0tgmqh3XscDIuMVNt2bChbdEtmZiUggU0CWv4it2IaLiokkHe27el+h
	R6cY7KKjCHmnCYXF07+cDwFaf/8hXB2Hb1ayyGs6tjek5D/Jk9+duwPTzGqZ4EGUdN56t12xmwo
	lPo37hXFGWjmymPcQ+Y+LJ+lSKKiBq/2sX30hd4HgDxqQ+7/u4I1iXhLbvrDtWydElcRehRPpVu
	fyNzWyvp+9Dhipfr+7W65jMza+64y4/hLHpHzq3oVwtEnUwssz0snkVI2fXvGv6g9YCuF+rnaye
	4AmvOcfFAYiXOaCMeyudcNeelGaV6vhsVjb2pBCtZBrJJ8ClVbnvoCok9kPtqUbuT2M6gQyeVLH
	qughGCmMJro3EUlvgTDjMtfHhfMjQPV3Gtj2cbUdpam9t/qYa+cptIJikHHXN5NdMvFpVDDGQgi
	F48hPk2PvaAFzS4o2CtfAhINOsOW015qnmPez93eor+lPsTJsrt+MW0MHyMctHaJ87PhI909BMN
	ibhKPTqyxFo6wwwDgpg45TrRktSMnBNQruBwRTzF5sJLsXF0YH0mq37KNasCh+vYib1Q08/1F04
	8UgAyy3VnYvkijVdxPC79wY5FOl6WDfXlUCKad7KmvB6CXpDCPTtScD4dVoo4pI9YutIUTfUM/w
	b0bQ==
X-Received: by 2002:a17:90b:5543:b0:3b1:6cab:f68b with SMTP id 98e67ed59e1d1-3b41c8d49a0mr4222346a91.11.1795220793267;
        Fri, 20 Nov 2026 16:26:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:31 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 05/22] ARM: dts: BCM5301X: EA6300: set gmac2 MAC address from nvram
Date: Fri, 20 Nov 2026 16:25:45 -0800
Message-ID: <20261121002603.25254-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
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

Describe the et0macaddr nvram cell and assign it to gmac2, so the MAC
address doesn't have to be set from userspace.

gmac2 connects to switch port 8, the switch's IMP port, which the next
patch makes the only CPU port.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
index 03d5546a147c..f8dd08cc7cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-linksys-ea6300-v1.dts
@@ -24,6 +24,10 @@ memory@0 {
 	nvram@1c080000 {
 		compatible = "brcm,nvram";
 		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
 	};
 
 	gpio-keys {
@@ -50,3 +54,8 @@ &usb3_phy {
 &usb3 {
 	vcc-gpio = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
 };
+
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.56.1

