Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7EB559C9B
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 12:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958053; cv=none; b=XyPQpPKaaG/VHD+sCuMLEIEVfkiZupiH3dTnK+xKyTQowELuTx4agHkN/ICBWkNH2lc9lYLjxKeNcJP8Vwu/yC3pelYSFqUCigZKlkNsGS0E01Gx/GttllTx4dW1PRNVJoqKswO5Y9tnwKh9oV8qMrMbpv+nBPxm4CQLvS25vWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958053; c=relaxed/simple;
	bh=3UKaD4rM4go22sDUpsRlvjUXuf+J3aOuz77zwirxZX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agc7Acd9wF2nl76qdxVL21NBeAjVDRDRp6xB529nzszkvkPvk+DRLMdTx9q6xH1y1AF50infee5DBZhT44tzRA0PQHtvImaYOPi7xQqkUbUujbOJxznmXR/LFScMkaWnTGQuCqpqiYMjGRkCrsdSN33Bo6DsVyeOu+kOdP4UoGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cOaxcO+l; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cOaxcO+l"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso46735e9.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 05:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788958047; x=1789562847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wuHyN6zqAofLWB78jkKtomccACb9bxHB5O8GjC+eKe8=;
        b=cOaxcO+lLAbSrEBVKS7D3TTS+6Bafd+2+fXxwdt+2UTrjFEHK7Yk/pw/eOVcJVkXjn
         /ikOalI/49Bz/pSZjyaHAI6ATg8ZJ2i8MbVl3LZbh/BO2ixOeldGb85Cz0dcpb7+cnx5
         DCl+Uz5dPeM8u398jxtEjRefu9n/+fPUHDM+zyGtDMEYvK/MTgD09elP8bEqEi55+fHB
         qz7XUoyNFOUr4YaWW0TrO+TaFfepjaAt7bUNAQU1AyMaF2uBivO1vr80tGeNuOT+dQax
         r4Uuk6XU7FwidqepE2uZ/yQXcBAH9Jh4Y8LTFYJ4aqqRgse8Kzh4Bzy/0Z82vsQ3aXCS
         ZMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958047; x=1789562847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuHyN6zqAofLWB78jkKtomccACb9bxHB5O8GjC+eKe8=;
        b=iDFcFzSV89fpNeE6MLgbIG661XOLeVzwgRvwl8U6gRhM/94GheNvn1g4cwWFixh9Gy
         71/1WSyKf3FpQz3oc/j9AfVjtKPAwD/heRiTIwyBgvNHEXCOIhjjhjbi3vNGE5w+m9Q+
         MkX2HQHNwVhEzBU9RfdcTo2bUN/8+VRjizNSenzxhjo5O308tZAhb6/4eq8XJMJKjuCy
         0icAjxnnYS3814iJ6vRG28JTHb47wDFL/NDjA4lnnHyWXzljXq1xrsXqO9IqDPPok5YD
         M3o7RmaoOQXO8iJEfm18ndnM6anj28oTJnP2KyH1B5IHp/2Rhn+UgGt/cNSykyqttDeB
         HhZQ==
X-Forwarded-Encrypted: i=1; AKwUvByccHC4ZFFnI3++GdhopMHERIsomZnJr/5RByOpwrm71R7JdDUdBHCBDK1KEXrk21otfh58AAapaaxk@vger.kernel.org
X-Gm-Message-State: AFuF++kLMeDGGUj29Dp03q56EX/QUSZlWh6E1ooeMzYGYyNR3Pk6o4v+
	XhsKmRMJyxb6dUDU605kRR9mmve9j6Xm56jf7UFhtPT9qJ4FEG3cesoR+8uNP387xg==
X-Gm-Gg: AYBFou1Ea+5KPaKjY79V0Dw3y7FdN1j+aEL+vGi9hKj4IzK/RacF0tjKeys0JbkD+2I
	feB4NmhhWdWt/pzNTvDzlO4a8Jyr1AD1ZtEJrUfxO7tosO6Nl+GNHHH3WLmkszSe4K4/IIYeoQ8
	yULI+Kfevr8vlOVHxb1yLe4BMRLcDweTAKDGohCo4Fwem9c+QsniWJKdG4z4W2nG/V9sPgV2CiV
	CboERwSNgJ7N+Ym0QDb8b3tpFCewgqs+2iahwf1+SDpUJgs2ATBuRr7OaOUphLOoGft5tE07yCG
	LCbulXqzo2+ZGK5UfGMnwJCFqR+1PzyXlVL4ckHqGm9quIHNV/lnLyJCtJtyYqGyY1kSLFnyeDi
	cWO0Z9L4PRkfeLknTKUQkjFeGuAauGZFT7R0zur6vShnCkxaZUvx9zbDPgDWkncw9eUmrv/zPFT
	Uae2Jx5Bd+DAlIXoDgk87+0GXlywYGQXPaXdNec7qu74MGrK1SX7YOYBT1PALdwOFBztlMax660
	vWZduQ9q9QVw1BXgl22XO4CwM95EC0ZuD1XrcKwr23e7DROTho=
X-Received: by 2002:a05:600c:c3ce:10b0:49d:3:4a29 with SMTP id 5b1f17b1804b1-49d2163e1f0mr507365e9.7.1788958046662;
        Wed, 09 Sep 2026 05:47:26 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fb2b95sm36271305e9.4.2026.09.09.05.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:47:26 -0700 (PDT)
Date: Wed, 9 Sep 2026 12:47:21 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: dts: qcom: IdeaCentre Mini 01Q8X10 Hamoa +
 Purwa
Message-ID: <aqFVWedkcb6PY-oh@google.com>
References: <20260905-x1-ideacentre-mini-prettify-v1-0-9a87882973bb@oldschoolsolutions.biz>
 <ap_PdUrwLIVGJ3oG@google.com>
 <dcae935c-ccbb-4cb5-a184-eb5dc2cc84b8@oldschoolsolutions.biz>
 <ap_qwdz-3WibXRjq@google.com>
 <364326dc-9715-4e77-bf25-4d0a30179826@oldschoolsolutions.biz>
 <ap_69OsnAOwQyo50@google.com>
 <9762659c-fbde-4887-8da8-200db7dfad09@oldschoolsolutions.biz>
 <aqBKI0Fg3ZqYPOJh@google.com>
 <6eaa70f3-4d76-4271-b12d-75e063c9f869@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eaa70f3-4d76-4271-b12d-75e063c9f869@oldschoolsolutions.biz>

On Tue, Sep 08, 2026 at 08:15:27PM +0200, Jens Glathe wrote:
> Hi Mostafa,
> 
> On 08.09.26 19:47, Mostafa Saleh wrote:
> > On Tue, Sep 08, 2026 at 05:04:44PM +0200, Jens Glathe wrote:
> > > Hi Mostafa,
> > > 
> > > This is my .config [1].
> > > 
> > > [1]: https://pastebin.com/QhDizqCB
> > Thanks! I tested with your config plus
> > - CONFIG_EFI_ARMSTUB_DTB_LOADER=y otherwise I can't load my device
> >    tree from UEFI shell
> > - CONFIG_SERIAL_QCOM_GENI=y, otherwise I can't see the console.
> > 
> > Booting in EL2 is similar to before with SMMUv2 errors.
> 
> For that you would need the patch as listed before: [2]
> 
> [2]: https://github.com/jglathe/linux_ms_dev_kit/tree/b4/x1-el2-unfuck
> 
> This should give you boot on EL2.
> 
> > Booting in EL1 hangs with timeouts and missing suppliers:
> > [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x512f0011]
> > [    0.000000] Linux version 7.3.0-rc1-next-20260904+ (smostafa@mostafa1.c.googlers.com) (Debian clang version 21.1.8 (3), Debian LLD 21.1.8) #2 SMP PREEMPT_DYNAMIC Tu6
> > [    0.000000] KASLR enabled
> > [    0.000000] Machine model: Lenovo IdeaCentre Mini 01Q8X10 (Purwa)
> > [    0.000000] earlycon: qcom_geni0 MMIO:0x0000000000894000 (options '')
> > [    0.000000] printk: legacy bootconsole [qcom_geni0] enabled
> > [    0.000000] CPU features: SYS_ID_AA64MMFR0_EL1[63:60]: forced to 1
> > [    0.000000] ITS@0x0000000017040000: Devices Table too large, reduce ids 32->19
> > [    0.000000] ITS@0x0000000017040000: Devices too large, reduce ITS pages 1024->256
> > [    0.163152] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.163313] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.168334] clk: Not disabling unused clocks
> > [    0.168336] PM: genpd: Not disabling unused power domains
> > [    0.170770] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.178347] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.184718] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.211932] Warning: unable to open an initial console.
> > [    0.212057] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.213907] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.213928] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.244210] qcom-pcie 1c08000.pcie: supply vdda not found, using dummy regulator
> > [    0.244275] qcom-pcie 1c00000.pcie: supply vdda not found, using dummy regulator
> > [    0.251833] qcom-pcie 1c08000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [    0.259418] qcom-pcie 1c00000.pcie: supply vddpe-3v3 not found, using dummy regulator
> > [   10.213618] qcom-pcie 1bf8000.pcie: supply vdda not found, using dummy regulator
> > [   10.214873] arm-smmu 3da0000.iommu: deferred probe timeout, ignoring dependency
> > [   10.228713] arm-smmu 3da0000.iommu: probe with driver arm-smmu failed with error -110
> 
> Since you don't load firmwares, maybe try these? However, I was able to boot
> and install with the Ubuntu Resolute ISO by providing the dtb, without the
> firmwares. Odd.
> 
> > I believe we are testing on different SoCs from your fastfetch:
> > CPU: Qualcomm Snapdragon X Elite 1E80100 (8) @ 2.96 GHz
> > 
> > While mine:
> > CPU: Qualcomm Snapdragon X Elite 1P42100 (8) @ 2.96 GHz
> > 
> > I enabled CONFIG_QCOM_SOCINFO which shows:
> > [root@alarm ~]# cat /sys/devices/soc0/soc_id
> > 635 # which does not exist in qcom,ids.h
> > [root@alarm ~]# cat /sys/devices/soc0/revision
> > 1.0
> Looks like nope:
> 
> root@mini-x-jg:~# cat /sys/devices/soc0/soc_id
> 635
> root@mini-x-jg:~# cat /sys/devices/soc0/revision
> 1.0
> 
> We have the same SoC, maybe different binning. You could try to boot up with
> the extended Resolute ISO to boot without firmwares [3]. It contains the
> same dtb.
> 
> [3]:
> https://drive.google.com/drive/folders/1sc_CpqOMTJNljfvRyLG-xdwB0yduje_O
> 

Thanks! I can boot ubuntu with:
resolute-desktop-arm64+x1e-20260831_extended_jg.iso

I figured out the issue, the problem is that I am using the console
which is missing. And all the warnings in the logs were just a red
herring.

With that patch on top of your device tree I can fully boot:
diff --git a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
index b720622c5d90..973e603bbb6a 100644
--- a/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-lenovo-ideacentre-mini-01q8x10.dtsi
@@ -13,7 +13,7 @@ / {
 	chassis-type = "desktop";
 
 	aliases {
-		serial0 = &uart14;
+		serial0 = &uart21;
 	};
 
 	wcd938x: audio-codec {
@@ -1183,3 +1183,8 @@ &usb_mp_qmpphy0 {
 
 	status = "okay";
 };
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+	status = "okay";
+};

However, the kernel logs are extremely verbose (I have 39 warnings)

Disabling MDSS makes it cleaner:
diff --git a/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
index 9813a570cf69..8dc038566f93 100644
--- a/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-lenovo-ideacentre-mini-01q8x10.dts
@@ -40,3 +40,34 @@ &remoteproc_cdsp {
 
 	status = "okay";
 };
+
+
+&mdss {
+	status = "disabled";
+};
+
+&mdss_dp0 {
+	status = "disabled";
+
+};
+
+&mdss_dp0_out {
+	status = "disabled";
+};
+
+&mdss_dp1 {
+	status = "disabled";
+
+};
+
+&mdss_dp1_out {
+	status = "disabled";
+};
+
+&mdss_dp2 {
+	status = "disabled";
+};
+
+&mdss_dp2_out {
+	status = "disabled";
+};

I do not have any media attached nor drivers enabled, but that
shouldn't make the logs that verbose, I can dig more into it.

One other problem, is that there is a missing a PCI bus with the WIFI
card:

0005:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0005:01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 1b)
0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0006:01:00.0 Non-Volatile memory controller: SK hynix Platinum P41/PC801 NVMe Solid State Drive


Compared to with my device tree:
0004:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0004:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
0005:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0005:01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev 1b)
0006:00:00.0 PCI bridge: Qualcomm Technologies, Inc SC8380XP PCIe Root Complex [Snapdragon X / X Plus / X Elite]
0006:01:00.0 Non-Volatile memory controller: SK hynix Platinum P41/PC801 NVMe Solid State Drive

Thanks,
Mostafa

> with best regards
> 
> Jens
> 
