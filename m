Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BF3C4174
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 21:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785359270; cv=none; b=EQaqetlQqji3G9/oFLkWKrmNSaJhXh9OpGvJs3DruLJV586sxTPwURW7VR96vN5Cfyqsx1nKwUX5IJ4O/877TIiIs2ocNwMXrbPjExctz0Xy/TwULq/SBgLqcOTOkBE/O68LhVXCCp12WnrK9qZkX3v7OBK47BkGMLFPHQhkxh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785359270; c=relaxed/simple;
	bh=j8prVsgk8AxpSTZWo0g0hN0zbhqqlOt9FnHRzVS6OIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/h+mDlIN62s6dKFNcWZ8XmnN9iZR7t0xYA2EEjqDEU2a3e88Fp4SPU2gEoKB9gtHPirWUh2Bqta9eUYlddf0TOCPfhgYwAKS/0/OLMTfNYBP7Sf9fdhb+lVcsjzVIG/PoJ3i15I0PwEPM28GMAJNBAr0lgONzDAOUxi9oUm/4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b=KDdVZ5/w; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freeshell.de header.i=@freeshell.de header.b="KDdVZ5/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1785359237;
	bh=7uS1SJtnnNqAKsge3hAwN9CYXHunUz41NTEePzQYfHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KDdVZ5/w6MoN6A8sSbXJxCDH44l9lSv5kAgbAFDynYbe/q52hmfiTyUGGXfcC1KEj
	 6519fmb/MHVjWJfRnfBf5I4CI6TxsyXpEK3pzK8UheOD8U6IDsNN0sPRYkEk/JOTNh
	 BLZZQW2tnGyXSJnENNzP73yG2NSlMBuL/KjZOObxVzNpQfO+jmTfJzR+TxNGr9JJ0J
	 QXPEbecufJBPjzirZU+rAaTPpjzI2dNMXVSPPSyjFmS7uSO+LnZINAMsh8o2CIsVdi
	 OHtsPD9uTRVGoTQf3WfYN6yKECeuIaD76wzWOwvwmyfMsz+n2aGLaJibJT5xJF+g5M
	 oSCtr6txTUpyg==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 3B43AB221845;
	Wed, 29 Jul 2026 23:07:16 +0200 (CEST)
Message-ID: <b1f10fad-e5ad-40a6-b37b-6e950736c1d2@freeshell.de>
Date: Wed, 29 Jul 2026 14:07:07 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot
 from SD-card.
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, Ilya Sorochan <k0tran@altlinux.org>,
 Conor Dooley <mail@conchuod.ie>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com
References: <20260306171939.84568-1-k0tran@altlinux.org>
 <178526175795.1708098.11834005845749245101.b4-ty@conchuod.ie>
 <a32646aa-446a-4f95-9293-40001aeedae5@freeshell.de>
 <20260729-electable-remake-1b8c94a452b7@spud>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260729-electable-remake-1b8c94a452b7@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 7/29/26 03:59, Conor Dooley wrote:
> On Wed, Jul 29, 2026 at 02:39:50AM -0700, E Shattow wrote:
>>
>>
>> On 7/28/26 11:02, Conor Dooley wrote:
>>> From: Conor Dooley <mail@conchuod.ie>
>>>
>>> On Fri, 06 Mar 2026 20:19:39 +0300, Ilya Sorochan wrote:
>>>> Add bootph-pre-ram to mmc1_pins clk-pins.
>>>>
>>>> U-Boot pruned their overrides recently in favor of Linux which broke booting
>>>> from sd-card for me and Heinrich Schuchardt [1]. Pruning commit:
>>>> 27f617019dd070cb61f2 ("riscv: dts: starfive: prune redundant jh7110-common overrides")
>>>>
>>>> [1]  https://lore.kernel.org/all/ffdfc550-559b-4c59-9873-3f040fc3bb0e@canonical.com/
>>>>
>>>> [...]
>>>
>>> Right, I am going to try this again. I don't think there's actually a
>>> valid technical argument against it, since it just affects the stage at
>>> which configuration is applied rather than configuration itself.
>>> If the configuration is wrong, and more devices don't use this configuration
>>> than do, people need to move the node to where they think should be. That
>>> shall be done separately.
>>>
>>> I don't want to hear about the politics about whether or not Starfive want
>>> to support it or reverse engineering of binaries etc. All that I care about
>>> is discussion of the hardware itself and which boards need this and which do
>>> not.
>>>
>>> Applied to riscv-dt-fixes, thanks!
>>>
>>> [1/1] riscv: dts: starfive: jh7110-common: fix jh7110 SoC boot from SD-card.
>>>       https://git.kernel.org/conor/c/42c57c049054
>>>
>>> Thanks,
>>> Conor.
>>
>> Second NAK to this being applied, again, do not apply as-is.
>>
>> As you're not interested in the technical discussion, then you won't
>> have one.
> 
> I am interested in technical discussion of the hardware configuration. I'm
> not interested in reverse engineering of binaries, GPL compliance or
> whether Starfive want this to work or not because I don't see how they
> relate to the correctness of the hardware description.

The commit message suggesting "...broke booting from sd-card..." is
missing information or should be clearer i.e. "The bootph-pre-ram
hint(s) allow that following the SD Boot mode of StarFive loader in
MaskROM the U-Boot SPL will have all necessary devicetree nodes to
initialize the MMC driver and continue booting U-Boot Main from SD
card". It has not to do with booting Linux from SD card, and is for want
of a more generalized description affecting any SPL that filters on the
patterns of bootph-* hints but U-Boot seems to be one-of-one the only
consumer of this that I am aware of.

Placement of this bootph-pre-ram hint in jh7110-common is (probably?)
not appropriate, as SD Card is not valid on all boards or even at that
mmc device, namely StarFive VisionFive 2 Lite eMMC, Milk-V Mars CM, and
requires testing to know if it breaks existing functionality on boards
with swapped arrangement of mmc0 and mmc1 with respect to SDIO module
and eMMC (i.e. OrangePi RV ? It has been awhile I may misremember this).
The functionality of adding this hint is not even possible for more than
half the boards, and no new boards will have it.

Repeating myself, Hal offered a description of the boot process but I
find that does not exactly match the hardware based on my
reverse-engineering effort. More eyes should be on this to explain what
the hardware does in context of the patch commit message. Are we
correctly describing this hardware, or not?

void _a000efa_BootMain(void)
{
  int err;
  uint gpio_get_val;
  uint get_boot_mode;
  uint32_t fuse33 [1];

  gp = _1100098_ext_csd + 0x68;
                    /* default value of unwritten OTP bits is 1 (high) */
  fuse33[0] = 0xffffffff;
  _a002900_gpio_init();
                    /* #define UART_BUADRATE_32MCLK_115200 115200 */
  _a00107c_uart_init(0,115200);
  _a002944_system_clint_setup();
  _a004908_starfive_otp_probe();
                    /* // get stride*1 bytes of OTP fuse data from OTP
at offset 0x84 (stride * 33)
                       // where stride equals sizeof(uint32_t) */
  err = _a004a12_starfive_otp_read_array(0x84,fuse33,1);
  if (true) {
    if (fuse33[0] != 0xffffffff) {
                    /* AON SYSCONSAIF SYSCFG 24 at 0x17010018
                       bits [1] u0_otpc_crc_pass */
      gpio_get_val = _a00023c_gpio_get_val(0x17010018,1,0x2);
      if (gpio_get_val != 1) {
        err = 0xfffffff8;
        goto _a000f50_boot_fail;
      }
      _a00022e_call_enable_security_clocks_and_reset();
    }
                    /* get RGPIO[3:0] state */
    get_boot_mode = _a0028e4_get_boot_mode();
    if (get_boot_mode == 1) {
                    /* boot mode 1 */
      err = _a0007e2_boot_from_sd(1,fuse33[0]);
    }
    else if (get_boot_mode < 2) {
      if (get_boot_mode != 0) goto _a000f50_boot_fail;
                    /* boot mode 0 */
      err = _a000c66_boot_from_spi(fuse33[0]);
    }
    else if (get_boot_mode == 2) {
                    /* boot mode 2 */
      err = _a00082e_boot_from_emmc(0,fuse33[0]);
    }
    else {
      if (get_boot_mode != 3) goto _a000f50_boot_fail;
                    /* boot mode 3 */
      err = _a000ae4_boot_from_uart(fuse33[0]);
    }
    if (true) {
      _2000004_CLINT_msiphart1 = 1;
      _2000008_CLINT_msiphart2 = 1;
      _200000c_CLINT_msiphart3 = 1;
      _2000010_CLINT_msiphart4 = 1;
      return;
    }
  }
_a000f50_boot_fail:
  _a0012a6_printk_vprintk_vnprintf(_a0068a0_BOOT_fail_Error_is_0xx,err);
  do {
                    /* WARNING: Do nothing block with infinite loop */
  } while( true );
}


int 2a0007e2_boot_from_sd(int dev,uint32_t fuse33)
{
  int err;
  mmc *mmc;

  gp = 01100098_ext_csd + 0x68;
  mmc = 2a0004e2_boot_sdio_init(dev);
  if ((long)mmc << 0x20 < 0) {
    err = -1;
  }
  else if ((ulong)fuse33 == 0xffffffffffffffff) {
    err = 2a00059e_boot_from_sd_without_crypto(dev);
  }
  else {
    err = 2a000688_boot_from_sd_with_crypto(dev);
  }
  return err;
}


mmc * 2a0004e2_boot_sdio_init(int dev)
{
  int r;
  mmc *host_mmc;

  gp = 01100098_ext_csd + 0x68;
  if (dev != 0) {
    01100a08_local_host0.name = 2a006790_SDIO;
    01100a08_local_host0.buswidth = 4;
  }
  else {
    01100a08_local_host0.name = 2a006788_EMMC;
    01100a08_local_host0.buswidth = 8;
  }
  01100a08_local_host0.dev_index = (int)(dev != 0);
  01100a08_local_host0.fifo_mode = 0;
                    /* u32 fifo_depth = 32;
                       host->fifoth_val = MSIZE(0x2) |
                       RX_WMARK(fifo_depth / 2 - 1) |
TX_WMARK(fifo_depth / 2); */
  01100a08_local_host0.fifoth_val = 0x200f0010;
                    /* host->bus_hz = DWMMC_BUS_FREQ; */
  01100a08_local_host0.bus_hz = 4000000;
                    /* if (add_dwmci(host, DWMMC_MAX_FREQ,
DWMMC_MIN_FREQ, 0)) { ... } */
  r = 2a0041ae_add_dwmci(&01100a08_local_host0,1000000,400000,dev);
  host_mmc = (mmc *)0xffffffffffffffff;
  if (r == 0) {
    01100a00_boot_dev = dev;
    r = 2a0030ac_mmc_init(&01100898_host_mmc);
    host_mmc = &01100898_host_mmc;
    if (r != 0) {
      host_mmc = (mmc *)0xffffffffffffffff;
    }
  }
  return host_mmc;
}


int 2a0041ae_add_dwmci(dwmci_host *host,uint32_t max_clk,uint32_t
min_clk,uint32_t dev_num)
{
  uint base;
  mmc *mmc;
  uint32_t caps_change;

  gp = 01100098_ext_csd + 0x68;
  (host->cfg).name = host->name;
  (host->cfg).ops = &2a006b00_dwmci_ops;
  (host->cfg).f_min = min_clk;
  (host->cfg).f_max = max_clk;
                    /* host->cfg.host_caps = host->caps; */
  base = 2a000202_sdio_base_address(dev_num);
  host->ioaddr = (void *)(ulong)base;
  2a000158_configure_sdio_for_mode((long)(int)dev_num);
                    /* host->cfg.voltages = MMC_VDD_32_33 |
MMC_VDD_33_34; */
  (host->cfg).voltages = 0x300000;
                    /* host->cfg.host_caps |= MMC_MODE_4BIT;
                       host->cfg.host_caps &= ~MMC_MODE_8BIT; */
  caps_change = host->caps & 0xfffffff7 | 4;
  if (host->buswidth == 8) {
                    /* host->cfg.host_caps |= MMC_MODE_8BIT;
                       host->cfg.host_caps &= ~MMC_MODE_4BIT; */
    caps_change = host->caps & 0xfffffffb | 8;
  }
  (host->cfg).host_caps = caps_change;
                    /* host->cfg.b_max = CONFIG_SYS_MMC_MAX_BLK_COUNT; */
  (host->cfg).b_max = 0xffff;
  mmc = 2a002e84_mmc_create(&host->cfg,host,dev_num);
  host->mmc = mmc;
  return -(uint)(mmc == (mmc *)0x0);
}


2a0030ac_mmc_init() is a rather messy decompile output of several large
body static functions lumped together, so not quoted here.

uint 2a000202_sdio_base_address(uint32_t sdio_device_index)
{
  gp = 01100098_ext_csd + 0x68;
  if (sdio_device_index != 0) {
    return 0x16020000;
  }
  return 0x16010000;
}


void 2a000158_configure_sdio_for_mode(long mode)
{
  gp = 01100098_ext_csd + 0x68;
  if (mode == 0) {
                    /* n 62
                       din ignore/no-op
                       dout u0_sdio_rst_n
                       doen "low level output" */
    2a002840_configure_sysgpiomux(0x3e,0xfffe,0x13,0);
    2a000306_enable_u0_sdio_clocks_and_reset();
  }
  else if (mode == 1) {
                    /* n 10
                       din ignore/no-op
                       dout u1_sdio_cclk_out
                       doen "low level output" */
    2a002840_configure_sysgpiomux(10,0xfffe,55,0);
                    /* n 9
                       din sys_iomux_gpi_u1_sdio_ccmd_in_cfg (SDIO_CCMD)
                       dout u1_sdio_ccmd_out
                       doen u1_sdio_ccmd_out_en */
    2a002840_configure_sysgpiomux(9,44,57,19);
                    /* n 11
                       din sys_iomux_gpi_u1_sdio_cdata_in_0_cfg
(SDIO_CDATA[0])
                       dout u1_sdio_cdata_out[0]
                       doen u1_sdio_cdata_out_en[0] */
    2a002840_configure_sysgpiomux(11,45,58,20);
                    /* n 12
                       din sys_iomux_gpi_u1_sdio_cdata_in_1_cfg
(SDIO_CDATA[1])
                       dout u1_sdio_cdata_out[1]
                       doen u1_sdio_cdata_out_en[1] */
    2a002840_configure_sysgpiomux(12,46,59,21);
                    /* n 7
                       din sys_iomux_gpi_u1_sdio_cdata_in_2_cfg
(SDIO_CDATA[2])
                       dout u1_sdio_cdata_out[2]
                       doen u1_sdio_cdata_out_en[2] */
    2a002840_configure_sysgpiomux(7,47,60,22);
                    /* n 8
                       din sys_iomux_gpi_u1_sdio_cdata_in_3_cfg
(SDIO_CDATA[3])
                       dout u1_sdio_cdata_out[3]
                       doen u1_sdio_cdata_out_en[3] */
    2a002840_configure_sysgpiomux(8,48,61,23);
    2a000356_enable_u1_sdio_clocks_and_reset();
  }
  return;
}


ulong 2a002840_configure_sysgpiomux(int n,int din,int dout,int doen)
{
  uint *p_reg;
  ulong mask;
  uint reg;

  gp = 01100098_ext_csd + 0x68;
                    /* if din != 0xfffe then assign Index=n SYS IOMUX
GPIOn Input
                       to drive the SYS IOMUX Input signal configured at
(13040080h+din).
                       Index values are valid 0 (GPIO2) through 61 (GPIO63).
                       GPIO0 and GPIO1 are not available. */
  if (din != 0xfffe) {
    mask = (long)(din << 3) & 0x18;
    p_reg = (uint *)((long)(din >> 2) * 4 +
01100020_sysiomux_base_address + 0x80);
    reg = *p_reg;
    *p_reg = (n + 2 << mask ^ reg) & 0x3f << mask ^ reg;
  }
  mask = (long)(n << 3) & 0x18;
                    /* if dout != 0xfffe then assign Index=dout SYS
IOMUX Output signal
                       to connect with GPIOn configured at (13040040h+n).
                       Index values are valid 0 through 107. */
  if (dout != 0xfffe) {
    p_reg = (uint *)(01100020_sysiomux_base_address + 0x40 + (long)(n >>
2) * 4);
    reg = *p_reg;
    *p_reg = (dout << mask ^ reg) & 0x7f << mask ^ reg;
  }
                    /* if doen != 0xfffe then assign Index=doen SYS
IOMUX OEN Output Enable
                       signal to connect with GPIOn configured at
(13040000h+n).
                       Index values are valid 0 through 49. */
  if (doen != 0xfffe) {
    p_reg = (uint *)((long)(n >> 2) * 4 + 01100020_sysiomux_base_address);
    reg = *p_reg;
    *p_reg = (doen << mask ^ reg) & 0x3f << mask ^ reg;
  }
  return 0;
}


void 2a000306_enable_u0_sdio_clocks_and_reset(void)
{
  gp = 01100098_ext_csd + 0x68;
                    /* Clock AHB 0 clk_icg enable */
  2a00024c_set_register(0x13020024,1,0x1f,0x80000000);
                    /* U0 SD Clock AHB clk_icg enable */
  2a00024c_set_register(0x1302016c,1,0x1f,0x80000000);
                    /* U0 SD Card Clock clk_icg enable */
  2a00024c_set_register(0x13020174,1,0x1f,0x80000000);
                    /* Software RESET 2 rstn_u0_sdio_rstn_ahb select and
wait for status */
  2a000264_configure_software_reset(0x13020300,0x13020310,1);
  return;
}


void 2a000356_enable_u1_sdio_clocks_and_reset(void)
{
  gp = 01100098_ext_csd + 0x68;
                    /* Clock AHB 0 clk_icg enable */
  2a00024c_set_register(0x13020024,1,0x1f,0x80000000);
                    /* U1 SD Clock AHB clk_icg enable */
  2a00024c_set_register(0x13020170,1,0x1f,0x80000000);
                    /* U1 SD Card Clock clk_icg enable */
  2a00024c_set_register(0x13020178,1,0x1f,0x80000000);
                    /* Software RESET 2 rstn_u1_sdio_rstn_ahb select and
wait for status */
  2a000264_configure_software_reset(0x13020300,0x13020310,2);
  return;
}


mmc * 2a002e84_mmc_create(mmc_config *cfg,void *priv,uint32_t dev_num)
{
  int cur_dev_num;

  cur_dev_num = 01100010_cur_dev_num;
  gp = 01100098_ext_csd + 0x68;
                    /* if (cfg == NULL || cfg->ops == NULL ||
cfg->ops->send_cmd == NULL ||
                               cfg->f_min == 0 || cfg->f_max == 0 ||
cfg->b_max == 0)
                           return NULL; */
  if (cfg == (mmc_config *)0x0) {
    return (mmc *)0x0;
  }
  if (cfg->ops != (mmc_ops *)0x0) {
    if (cfg->ops->send_cmd == (mmc_ops_send_cmd_t *)0x0) {
      return (mmc *)0x0;
    }
    if (cfg->f_min == 0) {
      return (mmc *)0x0;
    }
    if (cfg->f_max == 0) {
      return (mmc *)0x0;
    }
    if (cfg->b_max != 0) {
      01100898_host_mmc.cfg = cfg;
      01100898_host_mmc.priv = priv;
      01100898_host_mmc.dsr_imp = 0;
      01100898_host_mmc.dsr = 0xffffffff;
                    /* mmc->block_dev.if_type = IF_TYPE_MMC; */
      01100898_host_mmc.block_dev.if_type = (dev_num != 0) + 6;
      01100010_cur_dev_num = 01100010_cur_dev_num + 1;
      01100898_host_mmc.block_dev.dev = cur_dev_num;
      01100898_host_mmc.block_dev.removable = 1;
      01100898_host_mmc.block_dev.block_read = 2a002d1e_mmc_bread;
      01100898_host_mmc.block_dev.block_write = 2a004380_mmc_bwrite;
      01100898_host_mmc.block_dev.block_erase = 2a004232_mmc_berase;
      01100898_host_mmc.block_dev.part_type = cfg->part_type;
      return &01100898_host_mmc;
    }
  }
  return (mmc *)0x0;
}


The "reverse engineering of binaries" is the StarFive loader in hardware
MaskROM that immediately precedes the supposed consumer of this proposed
bootph-pre-ram hint as stated in the patch commit message. It is the
hardware specifically the functionality that we are purporting to
describe. So there it is an excerpt and if you want an explanation of
what that all does to save you the trouble of reading it I am sorry to
disappoint as I don't I don't understand a line of it. What are we
describing and are there more bootph-pre-ram hints needed?

-E
