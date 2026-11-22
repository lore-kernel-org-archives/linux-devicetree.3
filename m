Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378479;
	b=4Oqnd816G1x/IE6XIm51z3LnpB2mQm943Bz2av3nvmXxoonBxMRqCOnl4nvbthR2KBGN
	 qowA4KTW2TifoeRktVlP+57a1yq9nxwYawdqIQBjcdU/HfAIJYNOvUAKylnN9fYzdTOXT
	 /EIoh8QnaiUf1v+/gnGTV4mfHsr5FAUYcbP1AekhVPDK8q2cP7GIlQMWkqG7+a7RQbb4v
	 yxOfpDOwoOKi5jiVrX9OYkhbLxo5PDMxVk8Y3KPQVJvEu2Tg6eJKmnQ1VhcdYVAiwtxxP
	 iYbrOxwwkiL7SiC0162JNRXcfHRQs7Sn5IqcdQ0FpdI1KbeUwSrpGNgrSTFgxcaUFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kki0qsSE7BCZ2lK7VqSoIgvQXKkt0YloN5+bcnKIbws=;
	b=oLoKGpCmS4iAD2ApIgvDISrnjYoQCKmTnblz/0tSsUqzMlzMZYNayg+BPuW8LOu1qGr7
	 jtYMv7T3esEWPy5f0SEpgO1uTExToN++cOCdKndii+fcAjgZwq0PSmDIAfpl7lrshwaF8
	 hh5RZEAhbx2+GqoEPcs98mUL+twiDdnKaiUqm+cgJP8nr/xb/tcRoCI7V7PlD4HhPp73e
	 kSUMl8BM/QO9ZNBGZrFqjEZIyGlijv9fijPk2HXNOHamcvi9jT1Ku2BxhtHN+NLhHsB9l
	 QHc/Y8MoaHnyGNdnVRbSgdtwvjDF4bhg/TssYIR7p2QXDHw0aYO0N9uEM0Fx2+jLGlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5ruJtjD;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E28606A33F
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 20:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E28606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x5ruJtjD
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b894a5ce3dso3408545a12.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 12:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378477; x=1795983277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kki0qsSE7BCZ2lK7VqSoIgvQXKkt0YloN5+bcnKIbws=;
        b=x5ruJtjDXfdWqI6CFqdNiMUtQNQ8nyDEYFTBQ7q2mBFAVzajM4sToMtEDXUJuiowPS
         qAXa1AgNKQl+li3Iv3dBwRnb7ZZXMosY1IeulakZXptenoPtWuzUUZYYV/tf1o3vvVYL
         oTBC1kBcaMUxC391x/4Z044WHVVUnbYo0XmbDM9v1AwVS/L7yBMZggl1O3ifpilcXTwk
         v+MgNuz4bbgC1tm5zNe1/MWOi7qJ8ERSTFAkz+7zlHWcwZVHNuXSiTbLl09mLxCCy3Tn
         gu2+LrtjITETA/X/7mYcIs1MOJpH8VND1Pp/wV3yYoDl3nByQF+OQElAoreb8Yz4aDhx
         MdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378477; x=1795983277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kki0qsSE7BCZ2lK7VqSoIgvQXKkt0YloN5+bcnKIbws=;
        b=ELuMPYkVR6Vvtk/Q07tLuRZ9J2m9/A4M2UCF0g9EVAkCSgL4cItuUuuv5snxe2DPdn
         +CeimblMTnDC1wKSJEy9j50UEZB3/XQu3tcbbHWnIBQvRzszIIu7lZzy2wdHB9u9jMLK
         +pIXezaczeURX+o/qyNnrK07j/IYRt/eA8R7lx8age4rY6nxsuubJOjtzgs2H8/C5T46
         5dqyvTTBai3BJhW+gyYXQitxSePPFPbk7eJpyV8Wr2WX2U1OVWX6lH1AGidVZoWoMvcw
         UT+F+BNQlMHO4JG+JqdeZo0SoJNQEzgAi50IuSMwXFW9M4Mn45NCWNupQFQjY6lx7ggG
         a4RA==
X-Gm-Message-State: APuU4Z8idnt7+RPuTJTmklcgDDYzdm0b8Ne7nBRCXBjMQjOs10ckzPDN
	Ok37eKmk2QFX5//uk0rb/8a8a37dDuNpzokBNYuS/j2rm1uHESxb9UH6
X-Gm-Gg: AZFdTZecEy/SIFO0w0MGVLPskcHsvuQKjf9lHUP9d3x/KyUWXdvVHExTjNNAbhmB686
	G5oxfaga4yE+QSY6Pt90iVobCXzVMtGDk6LrAOXDUwbJcZz1SyCxolCPJqFBhas3P+mIrYrKFoT
	0FN0u3Bojj5DojBd0EzEgPcBEuy+4Coi4s70O43ViibkxI20+dvdYMQj62UE91UnREjbC66HuIv
	l1LlBJb9lt8EoM5JbsH5fy+vQPzWb92FgTRUAkVEps0M+8fmdforHu44SYA/+LwBNpxdDc/NgsV
	BRs2sv8ONs4wlWbPTZwwncSD6s1cN8dD23Mpsbwgc6U7eekwlSzav2UH5QgC6ap58AJHBvKysaF
	u4BHb22tPXFjjkeg6fk21PlelSTsVgGb3nWhkOYMvxorxRardOEbbh0wBjFowIK9W9cpDMEBcUM
	fABR+bB4TDMn0jap7JZQ3/46t+l3Js05HitptqcJ0/R9uHOpu/sl8tWTdDVL/MB9KaMF2DRGRAr
	LryMBn4OMHWt/LefaJamh3+WaZ3Zqv5TPnGnFwSEXqpp0QMx9SQKZ1vk/+94qOaCXpl5+OmIhId
	RzxomjNnA1Jd9iUNf1uxI093qH/pwl9Rfzy9tF27OSUfUhIMybs43AwD6jCLkjJJO0Fykx10kTN
	ZeYupdPpWeSrnuR9p7gCh1YrvEJRTiTc=
X-Received: by 2002:a05:6402:210d:b0:6ac:c1fc:8a98 with SMTP id 4fb4d7f45d1cf-6ba37ec77e3mr7124384a12.42.1795378476708;
        Sun, 22 Nov 2026 12:14:36 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/18] ARM: tegra: tegratab: Add pinmux node
Date: Sun, 22 Nov 2026 22:13:53 +0200
Message-ID: <20261122201407.23742-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Configure pinmux based on downstream code and device dumps.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 877 ++++++++++++++++++
 1 file changed, 877 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 9d18cb48a1e63..19f5549867a7a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -47,6 +47,883 @@ panel@0 {
 		};
 	};
 
+	pinmux@70000868 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			/* ULPI pinmux */
+			ulpi-data0 {
+				nvidia,pins = "ulpi_data0_po1",
+					      "ulpi_data1_po2",
+					      "ulpi_data2_po3",
+					      "ulpi_data5_po6",
+					      "ulpi_data6_po7",
+					      "ulpi_data7_po0";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			ulpi-data3 {
+				nvidia,pins = "ulpi_data3_po4",
+					      "ulpi_data4_po5";
+				nvidia,function = "ulpi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SPI1 pinmux */
+			ulpi-clk {
+				nvidia,pins = "ulpi_clk_py0",
+					      "ulpi_nxt_py2",
+					      "ulpi_stp_py3";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			ulpi-dir {
+				nvidia,pins = "ulpi_dir_py1";
+				nvidia,function = "spi1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* I2S pinmux */
+			dap1-pins {
+				nvidia,pins = "dap1_fs_pn0",
+					      "dap1_din_pn1",
+					      "dap1_dout_pn2",
+					      "dap1_sclk_pn3";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dap2-dout {
+				nvidia,pins = "dap2_fs_pa2",
+					      "dap2_sclk_pa3",
+					      "dap2_dout_pa5";
+				nvidia,function = "i2s1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dap2-din {
+				nvidia,pins = "dap2_din_pa4";
+				nvidia,function = "i2s1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			dap3-fs-pp0 {
+				nvidia,pins = "dap3_fs_pp0",
+					      "dap3_din_pp1",
+					      "dap3_dout_pp2",
+					      "dap3_sclk_pp3";
+				nvidia,function = "i2s2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pv0 {
+				nvidia,pins = "pv0";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pv1 {
+				nvidia,pins = "pv1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dap4-din {
+				nvidia,pins = "dap4_din_pp5";
+				nvidia,function = "i2s3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			dap4-dout {
+				nvidia,pins = "dap4_fs_pp4",
+					      "dap4_dout_pp6",
+					      "dap4_sclk_pp7";
+				nvidia,function = "i2s3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SDMMC1 pinmux */
+			sdmmc1-clk {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc1-cmd {
+				nvidia,pins = "sdmmc1_cmd_pz1",
+					      "sdmmc1_dat0_py7",
+					      "sdmmc1_dat1_py6",
+					      "sdmmc1_dat2_py5",
+					      "sdmmc1_dat3_py4";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc1-wp-n {
+				nvidia,pins = "sdmmc1_wp_n_pv3";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* SDMMC3 pinmux */
+			sdmmc3-clk {
+				nvidia,pins = "sdmmc3_clk_pa6";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			sdmmc3-cmd {
+				nvidia,pins = "sdmmc3_cmd_pa7",
+					      "sdmmc3_dat0_pb7",
+					      "sdmmc3_dat1_pb6",
+					      "sdmmc3_dat2_pb5",
+					      "sdmmc3_dat3_pb4",
+					      "sdmmc3_cd_n_pv2";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc3-clk-lb {
+				nvidia,pins = "sdmmc3_clk_lb_out_pee4",
+					      "sdmmc3_clk_lb_in_pee5";
+				nvidia,function = "sdmmc3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* SDMMC4 pinmux */
+			sdmmc4-clk {
+				nvidia,pins = "sdmmc4_clk_pcc4";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			sdmmc4-cmd {
+				nvidia,pins = "sdmmc4_cmd_pt7",
+					      "sdmmc4_dat0_paa0",
+					      "sdmmc4_dat1_paa1",
+					      "sdmmc4_dat2_paa2",
+					      "sdmmc4_dat3_paa3",
+					      "sdmmc4_dat4_paa4",
+					      "sdmmc4_dat5_paa5",
+					      "sdmmc4_dat6_paa6",
+					      "sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* EXTPERIPH pinmux */
+			clk1-req {
+				nvidia,pins = "clk1_req_pee2";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk1-out {
+				nvidia,pins = "clk1_out_pw4";
+				nvidia,function = "extperiph1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk2-req {
+				nvidia,pins = "clk2_req_pcc5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk2-out {
+				nvidia,pins = "clk2_out_pw5";
+				nvidia,function = "extperiph2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk3-req-pee1 {
+				nvidia,pins = "clk3_req_pee1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk3-out {
+				nvidia,pins = "clk3_out_pee0";
+				nvidia,function = "extperiph3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			dvfs-pinmux {
+				nvidia,pins = "dvfs_pwm_px0",
+					      "dvfs_clk_px2";
+				nvidia,function = "cldvfs";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* HDMI pinmux */
+			hdmi-irq {
+				nvidia,pins = "hdmi_int_pn7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
+			};
+
+			hdmi-cec {
+				nvidia,pins = "hdmi_cec_pee3";
+				nvidia,function = "cec";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* I2C pinmux */
+			gen1-i2c {
+				nvidia,pins = "gen1_i2c_scl_pc4",
+					      "gen1_i2c_sda_pc5";
+				nvidia,function = "i2c1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			gen2-i2c {
+				nvidia,pins = "gen2_i2c_scl_pt5",
+					      "gen2_i2c_sda_pt6";
+				nvidia,function = "i2c2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			cam-i2c {
+				nvidia,pins = "cam_i2c_scl_pbb1",
+					      "cam_i2c_sda_pbb2";
+				nvidia,function = "i2c3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			ddc-i2c {
+				nvidia,pins = "ddc_scl_pv4",
+					      "ddc_sda_pv5";
+				nvidia,function = "i2c4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
+			};
+
+			pwr-i2c {
+				nvidia,pins = "pwr_i2c_scl_pz6",
+					      "pwr_i2c_sda_pz7";
+				nvidia,function = "i2cpwr";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+				nvidia,open-drain = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UARTA pinmux */
+			uarta-out {
+				nvidia,pins = "kb_row9_ps1";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			uarta-in {
+				nvidia,pins = "kb_row10_ps2";
+				nvidia,function = "uarta";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* UARTB pinmux */
+			uart2-cts-rts {
+				nvidia,pins = "uart2_cts_n_pj5",
+					      "uart2_rts_n_pj6";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UARTC pinmux */
+			uart3-cts-rxd {
+				nvidia,pins = "uart3_cts_n_pa1",
+					      "uart3_rxd_pw7";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			uart3-rts-txd {
+				nvidia,pins = "uart3_rts_n_pc0",
+					      "uart3_txd_pw6";
+				nvidia,function = "uartc";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* UARTD pinmux */
+			gmi-a17 {
+				nvidia,pins = "gmi_a17_pb0";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-a18 {
+				nvidia,pins = "gmi_a18_pb1";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			uartd-out {
+				nvidia,pins = "gmi_a16_pj7",
+					      "gmi_a19_pk7";
+				nvidia,function = "uartd";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* PORT U */
+			pu0 {
+				nvidia,pins = "pu0";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pu1-2 {
+				nvidia,pins = "pu1", "pu2";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pu3 {
+				nvidia,pins = "pu3";
+				nvidia,function = "pwm0";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pu4 {
+				nvidia,pins = "pu4";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pu5 {
+				nvidia,pins = "pu5";
+				nvidia,function = "pwm2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			pu6 {
+				nvidia,pins = "pu6";
+				nvidia,function = "pwm3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* GMI section */
+			gmi-wp-n-pc7 {
+				nvidia,pins = "gmi_wp_n_pc7",
+					      "gmi_adv_n_pk0",
+					      "gmi_cs0_n_pj0",
+					      "gmi_wr_n_pi0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-iordy-pi5 {
+				nvidia,pins = "gmi_iordy_pi5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-wait-pi7 {
+				nvidia,pins = "gmi_wait_pi7";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-clk-pk1 {
+				nvidia,pins = "gmi_clk_pk1",
+					      "gmi_ad10_ph2",
+					      "gmi_ad11_ph3",
+					      "gmi_ad14_ph6",
+					      "gmi_cs3_n_pk4";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-cs2-n-pk3 {
+				nvidia,pins = "gmi_cs2_n_pk3";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-cs4-n-pk2 {
+				nvidia,pins = "gmi_cs4_n_pk2";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-cs6-n-pi3 {
+				nvidia,pins = "gmi_cs6_n_pi3";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-cs7-n-pi6 {
+				nvidia,pins = "gmi_cs7_n_pi6";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-ad0-pg0 {
+				nvidia,pins = "gmi_ad0_pg0";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-ad1-pg1 {
+				nvidia,pins = "gmi_ad1_pg1",
+					      "gmi_ad4_pg4",
+					      "gmi_ad5_pg5",
+					      "gmi_ad6_pg6",
+					      "gmi_ad7_pg7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-ad2-pg2 {
+				nvidia,pins = "gmi_ad2_pg2",
+					      "gmi_ad3_pg3",
+					      "gmi_oe_n_pi1";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-ad8-ph0 {
+				nvidia,pins = "gmi_ad8_ph0";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-ad9 {
+				nvidia,pins = "gmi_ad9_ph1";
+				nvidia,function = "pwm1";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-ad12-ph4 {
+				nvidia,pins = "gmi_ad12_ph4";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-ad13-ph5 {
+				nvidia,pins = "gmi_ad13_ph5";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-ad15-ph7 {
+				nvidia,pins = "gmi_ad15_ph7";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-dqs-p-pj3 {
+				nvidia,pins = "gmi_dqs_p_pj3";
+				nvidia,function = "nand";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gmi-rst-n-pi4 {
+				nvidia,pins = "gmi_rst_n_pi4";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gmi-clk-lb {
+				nvidia,pins = "gmi_clk_lb";
+				nvidia,function = "gmi";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* VI_ALT3 pinmux */
+			cam-mclk {
+				nvidia,pins = "pbb0", "cam_mclk_pcc0";
+				nvidia,function = "vi_alt3";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			port-bb {
+				nvidia,pins = "pbb3", "pbb4", "pbb5",
+					      "pbb6",	"pbb7";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			port-cc {
+				nvidia,pins = "pcc1", "pcc2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			jtag-rtck {
+				nvidia,pins = "jtag_rtck";
+				nvidia,function = "rtck";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			/* KBC pinmux */
+			kb-row0-pr0 {
+				nvidia,pins = "kb_row0_pr0",
+					      "kb_row1_pr1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			kb-row2-pr2 {
+				nvidia,pins = "kb_row2_pr2",
+					      "kb_col0_pq0";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			kb-row3-pr3 {
+				nvidia,pins = "kb_row3_pr3";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			kb-row4-pr4 {
+				nvidia,pins = "kb_row4_pr4",
+					      "kb_row5_pr5",
+					      "kb_row6_pr6",
+					      "kb_col3_pq3",
+					      "kb_col4_pq4";
+				nvidia,function = "kbc";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			kb-row7-pr7 {
+				nvidia,pins = "kb_row7_pr7",
+					      "kb_col2_pq2",
+					      "kb_col5_pq5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			kb-row8-ps0 {
+				nvidia,pins = "kb_row8_ps0",
+					      "kb_col1_pq1",
+					      "kb_col6_pq6",
+					      "kb_col7_pq7";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* CORE pinmux */
+			sys-clk-req {
+				nvidia,pins = "sys_clk_req_pz5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			clk-32k-out {
+				nvidia,pins = "clk_32k_out_pa0",
+					      "gmi_cs1_n_pj2";
+				nvidia,function = "soc";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			clk-32k-in {
+				nvidia,pins = "clk_32k_in";
+				nvidia,function = "clk";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			core-pwr-req {
+				nvidia,pins = "core_pwr_req";
+				nvidia,function = "pwron";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			cpu-pwr-req {
+				nvidia,pins = "cpu_pwr_req";
+				nvidia,function = "cpu";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			pwr-int-n {
+				nvidia,pins = "pwr_int_n";
+				nvidia,function = "pmi";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			owr {
+				nvidia,pins = "owr";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,rcv-sel = <TEGRA_PIN_DISABLE>;
+			};
+
+			reset-out-n {
+				nvidia,pins = "reset_out_n";
+				nvidia,function = "reset_out_n";
+				nvidia,pull = <TEGRA_PIN_PULL_NONE>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* AUD pinmux */
+			gpio-x1-aud-px1 {
+				nvidia,pins = "gpio_x1_aud_px1";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			gpio-x3-aud-px3 {
+				nvidia,pins = "gpio_x3_aud_px3";
+				nvidia,function = "rsvd3";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gpio-x4-aud-px4 {
+				nvidia,pins = "gpio_x4_aud_px4",
+					      "gpio_x5_aud_px5",
+					      "gpio_x7_aud_px7";
+				nvidia,function = "rsvd1";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gpio-x6-aud-px6 {
+				nvidia,pins = "gpio_x6_aud_px6";
+				nvidia,function = "rsvd4";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gpio-w2-aud-pw2 {
+				nvidia,pins = "gpio_w2_aud_pw2";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+			};
+
+			gpio-w3-aud-pw3 {
+				nvidia,pins = "gpio_w3_aud_pw3";
+				nvidia,function = "spi6";
+				nvidia,pull = <TEGRA_PIN_PULL_UP>;
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+				nvidia,enable-input = <TEGRA_PIN_ENABLE>;
+			};
+
+			usb-vbus-en {
+				nvidia,pins = "usb_vbus_en0_pn4",
+					      "usb_vbus_en1_pn5";
+				nvidia,function = "rsvd2";
+				nvidia,pull = <TEGRA_PIN_PULL_DOWN>;
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+				nvidia,enable-input = <TEGRA_PIN_DISABLE>;
+				nvidia,open-drain = <TEGRA_PIN_DISABLE>;
+			};
+
+			/* GPIO power/drive control */
+			drive-sdio1 {
+				nvidia,pins = "drive_sdio1";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <36>;
+				nvidia,pull-up-strength = <20>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_SLOW>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_SLOW>;
+			};
+
+			drive-sdio3 {
+				nvidia,pins = "drive_sdio3";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <22>;
+				nvidia,pull-up-strength = <36>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+
+			drive-gma {
+				nvidia,pins = "drive_gma";
+				nvidia,high-speed-mode = <TEGRA_PIN_ENABLE>;
+				nvidia,schmitt = <TEGRA_PIN_DISABLE>;
+				nvidia,pull-down-strength = <2>;
+				nvidia,pull-up-strength = <2>;
+				nvidia,slew-rate-rising = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+				nvidia,slew-rate-falling = <TEGRA_PIN_SLEW_RATE_FASTEST>;
+			};
+		};
+	};
+
 	serial@70006300 {
 		/delete-property/ dmas;
 		/delete-property/ dma-names;
-- 
2.53.0

