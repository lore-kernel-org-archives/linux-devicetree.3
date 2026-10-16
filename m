Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A413A0E99
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 02:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792118525; cv=none; b=Wigu5RbD/7g0uNs3tyHJdeOXpJK4JaG3swkV8/nU+YcddNWuKLfEHXpsRQewSV9UrVmQJ+Rk/3orJV0QaT3vNIzWb+Hzr8gQj6052jPWWOZoVQse85pUtScTqtzOWqutsnG+NeK5Wpnhm2iLu4eFV4o+Jf+gnUbxA64SEdRYfWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792118525; c=relaxed/simple;
	bh=R5QvKRD1kd1ywG8Xt9XPMUzDzXmbazFihpojrIpvY00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVr1c9BTqqWaAOWzSrKZ73fJVbfs1qYKLgE/pmOcqC47gin/Bu6agYvyUpDvW4uBnG4//o4d67/LuJUXNiVEOClpXEWI6mS3ibD0MCryOBXcKjM4ex/2khOl5TmYaO18j3z1Rij6A0QOZZkGxv0Hw5mVDlMGQSxAL0eRQojAoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jACB082j; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jACB082j"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1482622a91.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 19:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792118523; x=1792723323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jivYaZtVc5VWvcmUEsRCDj9BC+T6NVyJryDJSgOOOto=;
        b=jACB082jNqCoQB6rcGxfDIiPz1CPtDpNQJfLj2tE2bcligTe7innYgFOORBHGV6AmW
         V/Rxl4pWcIcsIZSttg/niIUPL5SVLMS7/BY4b+kNj1IIT4TeZfMgZ+gVx4NiC8YMRBIo
         72bvn1No/f6JIVXhTeoX3QAn3ukdzpKhn6nO7N4cSQVYNzXTOMvVZEtZnkjuh1NgoAdA
         NrYcf/0r/U9MACuqf12q2dzsQ8P60ZJHMRuUYBs6lWMJSWIYoel4FsaEF/a9rmW9e2fp
         oEnRRm9pm7OoN0X+Gtga7QdR5Tm8iw+S6YkOgR4WjLHQMNxgzLbdp3Sjk/tli7rwD9aI
         Gofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792118523; x=1792723323;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jivYaZtVc5VWvcmUEsRCDj9BC+T6NVyJryDJSgOOOto=;
        b=y8PWMNjGXgunQzNkTuPlyMHb643KmtuIXfMCZ/KgGyvqw9WBKC2xHCvd3NmbiZQ8q8
         pb1JNBiKPvd4RBF2OEC7Ibb621M52Qn3GJKYK49KFsanZTl7Tcyj9DIeTsfKCIi050x4
         P0KMMUM0rCWwCu8ZWoVnlfNeg2txgcdjortSjcMfT46cv+2rodeI5N1teETawCghTw8q
         al2tWjWmsw8V3sdDtzBnLTR6EoYrCtplDLrBgghqLboh5x9HICW5VJzBMLqSti7ZICpl
         kdW0OfVlH5xg4tXzsrQ9LqfE/Zk3IpDC4hHuJ/YbUMg4z6UDOzAopvFeZs02G7Vb8FOP
         xokQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYjI/FpvX0WZ3eE++InP9N3sZoUUfGipKzD0PeDOm39h1T6zGmZoIAExRHemVYL7XliOJcRoiadzZo@vger.kernel.org
X-Gm-Message-State: AFq9FYJGgPKxXi4+0yz9WEn3QKirjQYK962aRTJ89YtWBomrqcAtz5Q5
	VUaZclZsQyCB5omZYbR7zAwb4stPSsL2TZweumNk8vjvf1WPSZPvROG6
X-Gm-Gg: AYBFou3ggjZPZ+C3mZNoYO92re0DhAL9Q66Z8eenve/tvoiGdFoObGPoibmWVdCh2dU
	5IOezbAdG0gw9bNF/jD8u4wSGs4o7T/jLwlFMelpKYiapW1LXkbkS82JOfaTXKMLDk1F7z4kNei
	C7jVi+EuRdRvY5XDYGXy49sSLIBMA1SnLFAzRTIDk/on98eRbDVyAWLtE8OIPGHaz9qWLCzfAl9
	1dOpUptqef/xElPbiwkPFhOO7iUMdvcoHq53c2HD1wRoGYgTKe/srDk3B83q1nl238/CtuOG/T2
	E3JCd1U9c7yUoNUk0E8+xEZI+2/CIrkeg8taizWl+QZ+z04ChNaSbBgV1a5cado6l1iBYUCZkCk
	Yz6Ee6GK9EdeaDAZv7zrudAqYynYqZKWU73P75pdHY2+SFMUonQZYHYRQeZixP1Q96qj/mHCClX
	Dcn6eLfl9ptN+8M100r3FQZ1URSzC2BoYVVcHDh9RrcguGx7Z8CjM46yNxCJI+J7DQ7235pCu8T
	Qwj4xnRBhL02FTZMSRQKCwXYy6uSoclN9pfAH5lDqCzcA==
X-Received: by 2002:a17:90b:1d4f:b0:3ab:3384:1a44 with SMTP id 98e67ed59e1d1-3ab3a955e0amr18281855a91.12.1792118523062;
        Thu, 15 Oct 2026 19:42:03 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e7320sm6716943a91.6.2026.10.15.19.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 19:42:02 -0700 (PDT)
Message-ID: <06b3e996-2eb1-4bc3-9ee7-6780b2d62dd6@gmail.com>
Date: Fri, 16 Oct 2026 10:41:59 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver
 support
To: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
References: <20261016010448.324856-1-zychennvt@gmail.com>
 <20261016010448.324856-3-zychennvt@gmail.com>
 <sashiko-outbox-173541@kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <sashiko-outbox-173541@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/10/16 上午 09:17 寫道:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] i2c: ignored return value of I2C_SLAVE_WRITE_RECEIVED breaks flow control

As in the previous reply.
When MA35D1 reports `MA35_S_RECE_DATA_ACK`, the byte has already been received and ACKed,
so the driver can no longer NACK it. Propagating the callback error to the next byte is also
incorrect, as `I2C_SLAVE_WRITE_RECEIVED` applies only to the current byte.

> - [High] i2c: zero-message transfers bypass wait logic causing OOB reads or bus lockups

core rejects transfers with `num < 1` in `__i2c_transfer()` and returns `-EINVAL`
before calling the adapter's `master_xfer()` callback. 

> - [Medium] i2c: ma35d1: multi-master target arbitration broken by clearing AA bit

The MA35D1 hardware supports both controller and target modes. When a target
is registered, this driver intentionally clears AA while initiating a controller
transfer, so it does not accept transactions addressed to its target address
during that period. Preserving AA would change the current coexistence behavior
and require validation of the arbitration and target state transitions. We would
prefer to address that as a separate multi-master enhancement in a follow-up patch.
> --
> 
> commit cb2d83f6d803405066915dfcc01410b98bdff1a8
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> 
> i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
> 
> This commit adds I2C support for the Nuvoton MA35D1 SoC, including standard,
> fast, and fast-plus modes, and provides controller and target functionality.
> 
>> diff --git a/drivers/i2c/busses/i2c-ma35d1.c b/drivers/i2c/busses/i2c-ma35d1.c
>> new file mode 100644
>> index 0000000000000..29bed9eb28f67
>> --- /dev/null
>> +++ b/drivers/i2c/busses/i2c-ma35d1.c
> [ ... ]
>> @@ -125,12 +125,12 @@ static inline bool ma35d1_is_controller_status(unsigned int status)
>>  /*
>>   * ma35d1_i2c_write_ctl - Update the I2C control register
>>   * @i2c: Pointer to the ma35d1 i2c instance
>>   * @ctl: Control bits to set (e.g., MA35_CTL_STA, SI, AA)
>>   *
>>   * Read-modify-write the CTL0 register while preserving unrelated bits.
>>   */
>>  static void ma35d1_i2c_write_ctl(struct ma35d1_i2c *i2c, unsigned int ctl)
>>  {
>>  	unsigned int val;
>>  
>>  	guard(spinlock_irqsave)(&i2c->lock);
>>  	val = readl(i2c->regs + MA35_CTL0);
>>  	val &= ~(MA35_CTL_SI_AA);
>>  	val |= ctl;
> 
> [Severity: Medium]
> Does this unconditionally clear the Assert Acknowledge (MA35_CTL_AA) bit
> unless it is explicitly passed in the ctl argument?
> 
> If arbitration is lost during the START or address phase of a transfer, the
> controller will read AA as 0 and NACK its own target address, causing the
> winning master's transfer to fail.
> 
>>  	writel(val, i2c->regs + MA35_CTL0);
>>  }
> [ ... ]
>> @@ -262,17 +262,17 @@ static irqreturn_t ma35d1_i2c_irq_target_trx(struct ma35d1_i2c *i2c,
>>  	case MA35_S_TRAN_DATA_NACK:
>>  	case MA35_S_RECE_DATA_NACK:
>>  		/*
>>  		 * Data byte or last data in I2CDAT has been transmitted and NACK received,
>>  		 * or previously addressed with own SLA address and NACK returned.
>>  		 */
>>  		i2c->target_reject = false;
>>  		break;
>>  
>>  	case MA35_S_RECE_DATA_ACK:
>>  		/*
>>  		 * Previously address with own SLA address Data has been received;
>>  		 * ACK has been returned
>>  		 */
>>  		byte = readb(i2c->regs + MA35_DAT);
>>  		i2c_slave_event(i2c->target, I2C_SLAVE_WRITE_RECEIVED, &byte);
> 
> [Severity: High]
> Does this code ignore the return value of i2c_slave_event in
> ma35d1_i2c_irq_target_trx?
> 
> If the backend cannot accept more data, for example when the backend buffer
> is full, it returns a non-zero value. Because this is ignored, the driver
> unconditionally writes MA35_CTL_SI_AA at the end of the ISR to ACK the
> byte, which breaks flow control and allows an external I2C master to
> overrun the backend buffer.
> 
> Should the return value be checked and i2c->target_reject set to true to
> properly NACK the next incoming byte on error?
> 
>>  		break;
>>  
>>  	case MA35_ADDR_TRAN_ARB_LOST:
> [ ... ]
>> @@ -333,13 +333,13 @@ static irqreturn_t ma35d1_i2c_irq_controller_trx(struct ma35d1_i2c *i2c,
>>  	if (unlikely(!i2c->msg)) {
>>  		dev_err(i2c->dev, "Spurious controller interrupt (status: 0x%02lx)\n", i2c_status);
>>  		ma35d1_i2c_restore_idle(i2c);
>>  		return IRQ_HANDLED;
>>  	}
>>  
>>  	switch (i2c_status) {
>>  	case MA35_M_START:
>>  	case MA35_M_REPEAT_START:
>>  		ma35d1_i2c_set_addr(i2c);
>>  		ma35d1_i2c_write_ctl(i2c, MA35_CTL_SI);
> 
> [Severity: Medium]
> Since MA35_CTL_AA is omitted here in ma35d1_i2c_irq_controller_trx, the AA
> bit is cleared during address transmission. If arbitration is lost during
> SLA+R/W, will the target fallback fail to ACK its own address?
> 
>>  		break;
>>  
>>  	case MA35_M_TRAN_ADDR_ACK:
> [ ... ]
>> @@ -438,15 +438,15 @@ static int ma35d1_i2c_doxfer(struct ma35d1_i2c *i2c, struct i2c_msg *msgs,
>>  			     int num)
>>  {
>>  	unsigned long timeout;
>>  	unsigned int val;
>>  	int ret, err;
>>  
>>  	disable_irq(i2c->irq);
>>  	i2c->msg = msgs;
>>  	i2c->msg_num = num;
>>  	i2c->msg_ptr = 0;
>>  	i2c->msg_idx = 0;
>>  	i2c->err = 0;
>>  
>>  	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STA);
> 
> [Severity: Medium]
> Will this omit the AA bit and thus clear it when initiating a master
> transfer in ma35d1_i2c_doxfer?
> 
>>  	enable_irq(i2c->irq);
>>  
>>  	timeout = wait_event_timeout(i2c->wait, i2c->msg_num == 0, HZ * 5);
> 
> [Severity: High]
> If a caller invokes i2c_transfer with num = 0 to probe the bus, does this
> wait evaluate to true immediately?
> 
> When num = 0, i2c->msg_num is set to 0. This causes wait_event_timeout to
> complete instantly while the hardware is still initiating the START. If msgs
> is a zero-length array pointer or NULL, the subsequent interrupt could
> either read out-of-bounds from i2c->msg or fail to assert a STOP condition,
> leaving the bus permanently locked up in a START state.
> 
>>  	ret = i2c->msg_idx;
>>  
>>  	if (timeout == 0) {
> 

Best regards,
Zi-Yu
