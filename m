Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795379070;
	b=BR4wBO1nayqETK7JrP3hgxDjTGcWtS1ELZ6g+7dXxnLv1aN4uRwqe5wqJ0nL6F9LUNtJ
	 g+s8aHmN6ztj4CkTvUrFb7azVXoLQ1ED/JDMvRh2VEe6SRrZrQdrhrP4rrVrk3sWLQLsw
	 WNZzr0nQYWi2kFdJMj0SF/sqQGm1eyDsVh8oY1VXOHgGSVl8f8XTrRlvfn7P1+YMqNmNb
	 NMM77FIcgovKh9/L1SpCxrxXTYMnj+5z5NwhCbekaLIRpJee/b+wzkvUL32RxdQ5a16jk
	 9jGmJoh0Y4xqv5PnKrrbT4Gf3Xwav7u3+RFKNMYMfOgfaF0hA5INSaDNp3bl5XWS+1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379070;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=W0saEwQytD3uvCkQrs8M5XfLBUu7dlyain/D1tXVcKY=;
	b=KDCAkQxXPu3NT1UQ06SARrYTwVaPJnO7Iwb8PNg+zh5jUtnnwc12px5ZTF+3PQZ0MMc4
	 KJAVtrFf3/2f4+37gRcSyUswHwvr4ti0LLTPzDwO15HJIr6gSRZe7C7NHA68w72ezM34N
	 9t9ZbwuZ92+mzWr3Ilq6RHCVhM2UaNAxkWDCIRPCNKkWAeMPzghFPzt0XZ0+xFJ2X11Ve
	 2CFS1pOhr7evsoIik4KEKy2uLyY7cNXjTHw1ye6T4gOh5iBBF9YOp6qNbsL8qRe5JbuCv
	 jnB6xaLO/1dI3O9oYEYo53P9rgnUiy04GUNL8rfSSdjc2DSJIVovI8JKmBf6apdjXCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UWemDwgg;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427F606A327;
	Sun, 22 Nov 2026 20:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5427F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UWemDwgg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795379068; x=1826915068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rcgeMoxIEWePPJAz1f4GqmHb62WxQrALOVeHJzO0yU=;
  b=UWemDwgg2t5L3NsMB9J+yl9lmu7VWpthlm2MsgNkktA6nPUkFc9t9NrC
   fFRoCgfhp+e46/CuNwMGHWflhQ/OzMPEG3aJbD6coXrMOAG7dmuOZP9XT
   eeEfQo9z9Iny4vX1vxBTh31adueY9VPjyn2AAFO+/pReyaHhnjm2S9V9b
   7NDpaNhu0TE89gBkiyBOffG+4cPrxbw8ItU++ghR9b2V1f3G7bnylAfe7
   MihALD3CZGXTItoH+Fu0w1kGJgL040o1WQYpt3+5ld45fg+tw9ElEt2A1
   0ok+OtIg/X0+hypa4Q288znNxDNoIZf33AN6E5b+yYT+5eLMnso7fL5NH
   Q==;
X-CSE-ConnectionGUID: wWHTHwSHTWqRfXt6hTgNXA==
X-CSE-MsgGUID: NO2FVFedQ+STaTMwn3yCqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4185925"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4185925"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 12:24:28 -0800
X-CSE-ConnectionGUID: yO1d1dXORbWAun2YOPiApQ==
X-CSE-MsgGUID: olybKecSQRakBg0RJAb4vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11392727"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Nov 2026 12:24:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVE6n-00000001M34-0rot;
	Sun, 22 Nov 2026 20:24:21 +0000
Date: Mon, 23 Nov 2026 04:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
Message-ID: <202611230426.XGazeYTu-lkp@intel.com>
References: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-t8122-phy-v2-5-8d5c8fdf31ba@chaosmail.tech>

Hi Sasha,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein/dt-bindings-phy-atcphy-Add-M3-series/20261122-132757
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261122-t8122-phy-v2-5-8d5c8fdf31ba%40chaosmail.tech
patch subject: [PATCH v2 5/5] phy: apple: atc: Split generation-specific code
config: x86_64-buildonly-randconfig-1005-20261122 (https://download.01.org/0day-ci/archive/20261123/202611230426.XGazeYTu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/202611230426.XGazeYTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611230426.XGazeYTu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/apple/atc-t8103.c: In function 'atcphy_configure_pipehandler_usb3_host_t8103':
>> drivers/phy/apple/atc-t8103.c:33:21: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      33 |                     FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
         |                     ^~~~~~~~~~
--
   drivers/phy/apple/atc-t8122.c: In function 'atcphy_configure_pipehandler_usb3_host_t8122':
>> drivers/phy/apple/atc-t8122.c:78:16: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      78 |                FIELD_PREP(ACIOPHY_BIST_MAC_USBPHY_CFG_OV1_LN0_PWR_DOWN_OV, 2),
         |                ^~~~~~~~~~


vim +/FIELD_PREP +33 drivers/phy/apple/atc-t8103.c

    11	
    12	static void atcphy_configure_pipehandler_usb3_host_t8103(struct apple_atcphy *atcphy)
    13	{
    14		int ret;
    15		u32 reg;
    16	
    17		core_set32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG0,
    18			   ACIOPHY_TOP_BIST_PHY_CFG0_LN0_RESET_N);
    19		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG, ACIOPHY_TOP_BIST_OV_CFG_LN0_RESET_N_OV);
    20		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    21					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    22		if (ret)
    23			dev_warn(atcphy->dev,
    24				 "Timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    25	
    26		core_set32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    27			   ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    28		core_clear32(atcphy, ACIOPHY_TOP_BIST_READ_CTRL,
    29			     ACIOPHY_TOP_BIST_READ_CTRL_LN0_PHY_STATUS_RE);
    30	
    31		core_mask32(atcphy, ACIOPHY_TOP_BIST_PHY_CFG1,
    32			    ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN,
  > 33			    FIELD_PREP(ACIOPHY_TOP_BIST_PHY_CFG1_LN0_PWR_DOWN, 3));
    34	
    35		core_set32(atcphy, ACIOPHY_TOP_BIST_OV_CFG,
    36			   ACIOPHY_TOP_BIST_OV_CFG_LN0_PWR_DOWN_OV);
    37		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    38			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    39		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    40			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    41		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_CIOPHY_CFG1);
    42	
    43		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    44					 (reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK0), 10, 10000);
    45		if (ret)
    46			dev_warn(atcphy->dev,
    47				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK0\n");
    48	
    49		ret = readl_poll_timeout(atcphy->regs.core + ACIOPHY_TOP_PHY_STAT, reg,
    50					 !(reg & ACIOPHY_TOP_PHY_STAT_LN0_UNK23), 10, 10000);
    51		if (ret)
    52			dev_warn(atcphy->dev,
    53				 "timed out waiting for ACIOPHY_TOP_PHY_STAT_LN0_UNK23\n");
    54	
    55		atcphy_clear_nonselected_phy_reset(atcphy);
    56	
    57		/* More BIST stuff (?) */
    58		writel(0, atcphy->regs.core + ACIOPHY_TOP_BIST_OV_CFG);
    59		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    60			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_CLK_EN);
    61		core_set32(atcphy, ACIOPHY_TOP_BIST_CIOPHY_CFG1,
    62			   ACIOPHY_TOP_BIST_CIOPHY_CFG1_BIST_EN);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
