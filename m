Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887577;
	b=CWdWb0EJ/Bld1fz58EVYg6TaaLGjmbghqpN1+OAjIvi9O1TxCrgqIa9C2HCPK3Mp9P3/
	 JjqybiwZldPr62gaNvTWK/+n92Oo1nQUP8+6toai7I1ZCcgf0ZrMB6u6ikJwNJGS0y42x
	 OV/QrkniM9PdX0DBrEkM9mG+vNxcT2hmJ/moFUri2C8v0OeFTuafC9OJcOHyu785NAQn2
	 LZf2w29JsTCCLfXIR5lGth/zI8zIfI6UB18CyuZHXEh4MHwimuNnePUmc2AnsO7EizJyy
	 fPLD14Etlp8dIXOhT8dCp+XRsDYnPSbaUnuWNzHZ7iBbm/RIYA8pHpmt+nXTLPecwkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
	b=Ou17a3gbYrMcl4/K2T3296EG6AqSNjddcFh6GpKL6RWpNdjRvuEDHBnf8u/eBvmnnOHK
	 NOwwhYkY8l3LepIPS2Gqe4KhBhUJFXlG+5iek1481jJ/bsOfouvlouTIML4FdcqUSmMCl
	 RqNWq0Bt3B9qeAvAoMU+jbgu9uGuiNURYZ2xZhZplglRaD3HMySY+RkDJgi5l/SRCGglA
	 1xButgjRxZ70ogoRUyroyt8sAS1F6LZA1swucfzaHNo83ndStaSjZa/7hsvHlaE4i05ms
	 018H/5VDYnh7y3w0ikGWSe/kLvLXjx6dAACt/xWl4S67iCTNTHKHZ3mONU7hmD25IAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91CE606D80D
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 14:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B91CE606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UeOavdYD
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso865548f8f.1
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887570; x=1794492370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=UeOavdYDA9GU0sX0AIbUGnWqM0Qk4FJllDP19Y+wzPPKdyLCPH2T7CzOUJDdho6dYs
         aZnsmYJNYQOCdPemSGl3/wCasCvyVEeE4TJpJrlGB7ODypQuOqw/JDPwS1R8caJ4tlcW
         Y4K85Bpfh0ei98bnGyRgQcVZpPJ0NXvXqiiQXgIgm9fVIPJGJRaRl6IxWOmT3/Okzse8
         t+Ja2KQkaG6H6D4t4be/NdrHqXreSEIM7wT1/AkRQm/jovAtd5C4007e4bSUCeMMeaV9
         eDMmar98AfsVxt/z7DyAUFCyy+fDbftMdxftqkVYyTrlBrWUL7s6IV7O1JFq9d9q1ZLD
         unUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887570; x=1794492370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWQWFAQ/YeW0U3f8X8JNgjR9sIicTFidkftaJdNSKFk=;
        b=ZQ8djnLzICpmOh/AvKM6Z2FukLgJIEcrGw4eu50UgF66w4PBiixMfu9j0T//LhjY8n
         ipeS/tq0JFFYmJb42S8UNNnxPiIEGJI/IKf6XTqbDBFngB0+XHYSgyjzv/YvZ8J2QYP6
         DZHKJNw8LbE++u/gmAYvlbJx+Cs98B3IkoqCMI6PGtihxz9BLpRI1CMAeusO/GlZI9y3
         d2qBzF0K/3LwqDb8uEaUV2UDpZYdAduvay1hLxtA6jKXRKW7VA+HpvV42zL5KwsdtJYu
         SWSNO4uYrFEmTzVbE9mNvUAspugIi3TRVLnJ9lGqxVHw6dmCqjtY73ltZsX5olYFlrza
         FWhA==
X-Forwarded-Encrypted: i=1; AKwUvBy3PFDofTAkkLb3vFzBbEA6STeIX2gO4TPThJ75wiIQgCmsJ31RM9EMTr90disYY7okudEhjhvi4Yq1@vger.kernel.org
X-Gm-Message-State: APuU4Z/+sNgt/XapPKgFAE4+FEgLo/zsnklFd2jj/Q2wiwLwGSxjrdcn
	IE5JNiPCXt0D5Bv/SCqJdEojnI8w/Oi4QZuiW2yDUh7nsnVFazNMaH1e
X-Gm-Gg: AYBFou369AC/3P2xJGJMx2pQgUdaQGeoYsdKmUnFEV6oJmsGGV+XXo/fJKKBWmqq/3B
	ltFmFhi418vnRyNwl1juZHJu4KuOSQubg8FAPU0QE+bdHulc9XtHE/e29Cmv//aG2cS9KPxZzVv
	LZ+EhdGam79j7l3n8N2wp5lEDffn7QdQ9rSTbcpOTH8/XLDNX0qqfAFMdKlw4Q4EBv2pOKU5ACm
	NTE7/ToM6lCqSnP0Gfdd4bMII9fIu47r1FRGE4q3KUDwrdcMHPkp2tHOuATQnREfB1iPAXDmZlq
	SwkM3mGJrhbR/fh94xJU3STCYb9LAza2RRpEpPFPthaerKXOu0VGXg2PdDxqB7iOX84VwA23eti
	uisrMw38/CnxpbKJ+tjIkOHV6RqkdnTTdqgGtqdnD7DPAPwVQO31QpLUqmkxSKZLVwe3wAlIvOS
	DhEqjLJFvf2tsa0/S9wgzCRNlWJFD4a7D5Sk/7szYgHnTggkvX2MZ3lE8h1GgD/6eTzAvIri52C
	fhzQlzyE8UfUr56fS36Dv2eYvUwp+p0dkmn6DEALgwF6+89dd+/qtztGh941FyyDZR4ce7Fv5nO
	uT7CSR7Al07LoAI3MAfZuZTkgLX5uS7f+pz6bXKdCxFwh38eYdzSrg0UdI9gm0O5wHtGaHc=
X-Received: by 2002:a05:6000:2c03:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e6e4fca93mr39774284f8f.51.1793887569888;
        Thu, 05 Nov 2026 06:06:09 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/10] drm/tegra: rgb: Parameterize configuration based on bus flags
Date: Thu,  5 Nov 2026 16:05:08 +0200
Message-ID: <20261105140510.165165-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Parameterize configuration based on bus flags passed from the bridge or
panel. The list of supported flags includes now pixel clock polarity,
display enable (DE) polarity, and data alignment.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/rgb.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
index 7dea0cac61233..d8f41d1ca350e 100644
--- a/drivers/gpu/drm/tegra/rgb.c
+++ b/drivers/gpu/drm/tegra/rgb.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/media-bus-format.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -106,6 +107,7 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	struct tegra_output *output = encoder_to_output(encoder);
 	struct tegra_rgb *rgb = to_rgb(output);
 	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
 	struct drm_display_mode *mode;
@@ -117,12 +119,21 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
 	mode = &crtc_state->adjusted_mode;
 
+	/* Get but flags from the bridge state. */
+	bridge_state = drm_atomic_get_new_bridge_state(state, output->bridge);
+	if (bridge_state)
+		bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		bus_flags = DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
+			    DRM_BUS_FLAG_DE_HIGH |
+			    DRM_BUS_FLAG_DATA_MSB_TO_LSB;
+
 	tegra_dc_write_regs(rgb->dc, rgb_enable, ARRAY_SIZE(rgb_enable));
 
 	value = DE_SELECT_ACTIVE | DE_CONTROL_NORMAL;
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DATA_ENABLE_OPTIONS);
 
-	/* configure H- and V-sync signal polarities */
+	/* configure H- and V-sync and pixel clock signal polarities */
 	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(1));
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
@@ -135,11 +146,31 @@ static void tegra_rgb_encoder_enable(struct drm_encoder *encoder,
 	else
 		value &= ~BIT(PIN_LVS);
 
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
+		value &= ~BIT(PIN_LSC0);
+	else
+		value |= BIT(PIN_LSC0);
+
 	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(1));
 
-	/* XXX: parameterize? */
-	value = DISP_DATA_FORMAT_DF1P1C | DISP_ALIGNMENT_MSB |
-		DISP_ORDER_RED_BLUE;
+	/* configure DE signal polarities */
+	value = tegra_dc_readl(rgb->dc, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
+		value |= BIT(PIN_LSPI);
+	else
+		value &= ~BIT(PIN_LSPI);
+
+	tegra_dc_writel(rgb->dc, value, DC_COM_PIN_OUTPUT_POLARITY(3));
+
+	/* configure DATA order and alignment */
+	value = DISP_DATA_FORMAT_DF1P1C | DISP_ORDER_RED_BLUE;
+
+	if (bus_flags & DRM_BUS_FLAG_DATA_LSB_TO_MSB)
+		value |= DISP_ALIGNMENT_LSB;
+	else
+		value &= ~DISP_ALIGNMENT_LSB;
+
 	tegra_dc_writel(rgb->dc, value, DC_DISP_DISP_INTERFACE_CONTROL);
 
 	tegra_dc_commit(rgb->dc);
-- 
2.53.0

