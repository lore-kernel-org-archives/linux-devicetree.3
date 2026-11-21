Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264617;
	b=TpIMTjz8NbjNjxDgiIPqKN39107xOd9SxIn8s9W+frYYJy6X/v9aSa+WMffGdHxtOf81
	 WM/5aru9JPL7zU5emTyBnvnFMfMJgrGPu4x7SrYb+MpxqlxtvnCmFF4z6uRNMAuoF7mM7
	 mecY/1UX8wxAD+by+5usW1M/ApLuzaBOyCDQJzeGfvlv+OpYUx0QC8+0Z7vRHtVwotBCj
	 tNRQLXY5P7x9vHGdXkWgSs6CsyHojxJHhCYzDIzJKDP5Rd4MDZtV5yV2Ym9c59co8gFs9
	 mIXKUzxlDM4iJetbZrQemPAtHh52hlwhW6GWRxAuWWcyuIFbQ0nsPAqHukeXqYTfsGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264617;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ecaFsi2e5LNEjbPjQmXTKmGsw/5A00VPELVlO9Khp+U=;
	b=CHDj6RrjZ5RdH986dc6FJk5MQjKw7Km0Pmy/0TGeqbg8aM6bOJbPQABM0/1p173EER95
	 qxR4UWNKJQOT7fhinMyCDvaf7hpAV2E1O99ciDc93sdMHre4nlMtPLBvDx1PJeaZAAWOo
	 ccP5kD5te2E0yFFNjQ6JQZrWn5ZaOGv7y7O0/kZckA2JS21doIINr2vmI8ez72Z/luhak
	 +Wgy+bYoSVIr0Aru1CBnPzfZ0z0g3DJS5+m7uRgR0Zh0amhHDTTIv3rV/I0T3IYPUWLlw
	 D7QtvBRFtoT4f3tBpDyNvqnjZ6QzzFQOqhdyuONZlIsgbAeopRqHTX4Q7s73MtZH9Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9LEHQbx;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF1606A320;
	Sat, 21 Nov 2026 12:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CAF1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F9LEHQbx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795264618; x=1826800618;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vzevyCRwbcuYgq6/jbeCiti9NxgogyfaH27PDNXIwbI=;
  b=F9LEHQbxO4bESnSmEEB8MgYloxj+GgyaWATRdf1GGfxlB6qHrSXnJ/Ht
   YPa7JoX2DoKbf3bo8q9+Z7u1d0xtQbm5B1WDf3tps2pFVhruAaDw/ilFb
   3AhU0KLik54BByvtWyQ7+nuIr2k+hMqPinbcVnbG2xZYVP3SZUmWhGrCz
   1cdTUN+pAsIFcezth1TLmr7uGDDGa/CtGdQhwCu+KSnovLGLYUNMlNXQK
   slH1phRkBOfUGdIrpZb5Y+eISE7ZsS/2dSjiXr0FVk7Ci8G+NUj39F4on
   GSOjOVqV/gZXxyCNe58Hde8lc0ouKpM7GD5F+GLdnzHjiAnpMFIRGkkEI
   Q==;
X-CSE-ConnectionGUID: 6EKHnJt/RlSxSAHVFlDFCA==
X-CSE-MsgGUID: s5qGLp3mRQu80ihluKNwTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4022310"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4022310"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 04:36:57 -0800
X-CSE-ConnectionGUID: 2aGCBJTUTxejGB3+KsWypg==
X-CSE-MsgGUID: cnRiy/mqRGaPtXl2VNqKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10811808"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 04:36:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUkKp-00000001K21-2IsS;
	Sat, 21 Nov 2026 12:36:51 +0000
Date: Sat, 21 Nov 2026 20:36:37 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Message-ID: <202611212016.DdozCIS5-lkp@intel.com>
References: <20261120113952.168265-3-paul.cercueil@bootlin.com>
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
In-Reply-To: <20261120113952.168265-3-paul.cercueil@bootlin.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dt-bindings-mailbox-add-Marvell-MHU/20261120-123951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20261120113952.168265-3-paul.cercueil%40bootlin.com
patch subject: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261121/202611212016.DdozCIS5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611212016.DdozCIS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611212016.DdozCIS5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mailbox/marvell_mhu.c: In function 'mrvl_mhu_send_data':
>> drivers/mailbox/marvell_mhu.c:96:9: error: implicit declaration of function 'iowrite64'; did you mean 'iowrite32'? [-Wimplicit-function-declaration]
      96 |         iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
         |         ^~~~~~~~~
         |         iowrite32
   drivers/mailbox/marvell_mhu.c: In function 'mrvl_mhu_last_tx_done':
>> drivers/mailbox/marvell_mhu.c:106:18: error: implicit declaration of function 'ioread64'; did you mean 'ioread32'? [-Wimplicit-function-declaration]
     106 |         status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
         |                  ^~~~~~~~
         |                  ioread32


vim +96 drivers/mailbox/marvell_mhu.c

    89	
    90	static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
    91	{
    92		const u64 doorbell = 0xff;  /* Arbitrary value, SCP requires a value */
    93		struct mrvl_mhu *mhu = chan->con_priv;
    94	
    95		/* signal SCP */
  > 96		iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
    97	
    98		return 0;
    99	}
   100	
   101	static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
   102	{
   103		struct mrvl_mhu *mhu = chan->con_priv;
   104		u64 status;
   105	
 > 106		status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
   107	
   108		return status != 0;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
