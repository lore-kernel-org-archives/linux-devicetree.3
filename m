Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6139F372696
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 12:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920428; cv=none; b=Xz0YsaMEGWZszUbHZZsqttZQggZzJyHo3dynoNOQvujAxagPINIWfFeqsD1ve7ixap32f43EW7u7dJ3/kxLfYO393zCkhB49PRY72d2dT5KEr2vCsGHyWa0I6CV16O10vT4FA8IKM6RcNEJFfg1+EpswgMqyBCTZZEIy47nzg28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920428; c=relaxed/simple;
	bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5dgbI8CZq6V6hXJvEHnYldhvdiNpPYoCYWCTsGGYOCVPDwjg9HmVc6u/tRmSDnVhMpSbDLANDN5gd0cmIWHdKQVUS0O6B7Azf1zSlNRKnPPuS4q1HZGnZNzr3LfOUuyQRxWI0Yy0sRlEdmYryCGcgp2osKmA6FB3TT1yQwUP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m58pAURf; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m58pAURf"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6603d8697d2so4213342d50.0
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 05:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780920426; x=1781525226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=m58pAURfskfG/t2Na4/QotmrN/jy9uoV8j4ewQZnvHqAfR0ON2cDBMjxtmyUQHKtAp
         byQStjtMQj8CoQoXnXSMPOD1ZiRFFnJMod6RTFk97mMct7CSo2KQkI5RjUn+WGlz62IY
         424KEgeTe14vPAaDIFUtBsbeX8y1iqVdLQ5M4ueV3dgRKSRxAGMxeqDFO5eQS87EVhP4
         8rcMDHMvzDFQJVeQx4yzc8SIdcBQAG9wWID3hQ1qDtoTveHCRsawcGPOTxnIs54bRdTW
         g7gnrcfFZsvqcwyU26JhDJYum67zMA3iw/TAmQXxk7cTts3hksqXFMm7KS3I3ExGHDYN
         ZFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920426; x=1781525226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxmYofmvW5hO5Z4QL52f7IjdI8gGLubEjn1v9Iv3K/w=;
        b=XBmQf2ge9iwoKqTNNSx0n+dwjchR8xgWCDY15fHTf/6o77y+vdTTf5HLMD1i17Ev44
         tkVFFgjrT5lRyzM4Ls/LuhLmgFuba8TYXJuLibiX/LL1SpCR7OYVtUC2I6gAM5VRJG2u
         JO12TJugDaoLBb5jnAx3AkQhPQCqPZ6em5o38/8sP+7urKVPyC9gzapcHcyL5Tw8wtYo
         xYGil/tLALWGiRpj0t181LEvgTWDuhQByutOzHzMMIJOyGJl3og1eefxk51bR3q59XLq
         xXw/1vXjq4/FVYj1DXpZTi9Fh3GB/Dzg2+2JFmvR/mAIFfLqUic2l0F72fdZcIjIWFxI
         Ogvg==
X-Forwarded-Encrypted: i=1; AFNElJ8LwiiWw4r4i6U7dcQgnWVry387lBEMDQqGdrLmqNWMMdu8VTEl1lpol+Ddb0falgmk+GpGG89Z9aOH@vger.kernel.org
X-Gm-Message-State: AOJu0YwSentiVEwB411bX1BoXkxLzgPyNAPUfaGfOHNc/ofYGMxSZrt8
	fc53mwZbm9FeDd+DMzTqdhy1msdRRaw8Kqe/Xvp/9vtLcZ987q/rDTKK
X-Gm-Gg: Acq92OFLzyh0zF4lAvUkfJ8NEaDx1YURIxG4HsGMyIPSl61Jiq0TJDkJP2nha+ufXjp
	aROfhVZ3We4P/L7zaJX+SMnXR/Q4PcrT9+RA4The50rKpV+HBA3dFwlBh0rvx191zaS4WUI13nf
	nCHaYkEinntwmV+YFQknQR8Nje5ClauMtqTuuVaeHqKjjaP94wB0WvE9OLEFJ2UtYKXtQTeOIzH
	Z6r/5duZJ/Q38nCObTCIiMOMfSk6oEKJSm86QtglVuY97BBHPo9p1UpBP0041jZZPvTi1UEX37e
	Gr73RBMi74TgD+ZMZr7XhGArCLD42DemkInWXR7q6RfwARe9hSYcwEYLQEQTCIZ3kS+zemRPn3N
	nt6m6tuC7ZwieAMJzKSwfgZVkX0tUs9q7eXWxd8US5kco/eArzzJTwccp+QkMaj7iQgWbezKbIP
	+db8GUnErbebzqXk8ih6n+XiULRks1IDNlAiqMauBlkosF5OwM2RTFbDVP5nyKCLMNLrA=
X-Received: by 2002:a53:bb91:0:b0:660:eada:ea0e with SMTP id 956f58d0204a3-66106fe6ed4mr10422864d50.39.1780920426381;
        Mon, 08 Jun 2026 05:07:06 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9dfc1sm164019946d6.4.2026.06.08.05.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:07:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:06:59 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com,
	unicorn_wang@outlook.com, inochiama@gmail.com,
	daniel.lezcano@linaro.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, dlan@kernel.org,
	chao.wei@sophgo.com, anup@brainfault.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v5 RESEND 4/5] riscv64: dts: sophgo: add SG2000 dtsi
Message-ID: <aiawY8BlHlSFXbSJ@sleek>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <20260530173347.33533-5-josh.milas@gmail.com>
 <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ10GDDAE672.1N365YARL5KV1@mailbox.org>

Hi Shuwei,

The 256 MB was not intentional and was a holdover from testing. I updated the
DT to use 512 MB of RAM. The issue was only on the riscv side. This will be
fixed in the next patch.

- Joshua Milas
