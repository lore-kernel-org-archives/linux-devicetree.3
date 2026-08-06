Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35F9318BA6
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 08:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786004130; cv=none; b=HEsZWCVhOtYzG+DVicI/vdC0nWkaGfcgOkhArfo8TYzXOTNvCax2Ga3dUscFhlbIKBLacvIFkas/dSqWNeWO0O702oAQOC1CUq66quznI8YUqXvqvA/ScGRqlJzqxmu9ZDcIcYMbj/aDFeYAYCVhFX8F4xfw8zId+XsgSE8jD5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786004130; c=relaxed/simple;
	bh=lSicgOWfFyFX904RBP0Ahnm628nd/WIlp22f4h4sCeQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6Q3CcuuChCTzfK2r2nlxBE5HEXbD7M+9aDjQtnDa7RYAX4wy2Rrlu/Tv/+vccddvsStGX6Lo1Zr9wR3juULO22JK0zaxn/ZmjypyshQMNEXX9u+2G4pWT9isvuKgNIGebQW08rtlEzstiyfSQsmcqFx+xHyw8yYqD9OR3jzse0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMXS2pJO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMXS2pJO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-496b7622a83so15394645e9.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786004126; x=1786608926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gM9IN2/npqCkPX/AjXxyRJsM409ZJAwxp/k8ZTKIPEQ=;
        b=iMXS2pJOe5e1Wk/sdyTaPUuDf3GbLlKiJA1AcFomHtqdRgE1uxulItQA20KpePQzuR
         h88gXsOKCwqQdUBX7SIglAOvtpw68BzpfHXGT64I34NkCxIdQVK1Wh+pPGGImFMEGb5K
         +0iNXI9Qdk4yvMxQp89nFhxh9536g2/AGX8SoFxhKCMNPJvURJHRBJ+NpKLPJsfeCJa2
         MKLZ0VUhHONLoKMgXEA51EnjwFNWyMziyO5yll88Vg0SBwA/o5zNiLuVyA2IG880xjZ2
         WqvxHR0SYZ2n7tEBfyiSDWdj4G/F+ycKNP1yIs5flC/5gWtaDDsp7XeBGPvphfIYWt8M
         NiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786004126; x=1786608926;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gM9IN2/npqCkPX/AjXxyRJsM409ZJAwxp/k8ZTKIPEQ=;
        b=GZWbhIbVgtRLIZuDMzt7Cg3KXJWUm9nlsnlVQgh4AVUGLmDEmhB+6YBmQsuxLu17ZX
         +5pU4ZHARbzF78vQxMLx7Flmroh+s9B7Ng7ABoWwv7hNE6GQLYTq7a3vugyl4FEWqGq9
         gIxWoJTky2D9szxaRbWFhZ1m4GovlGmW8SNw0xXYFuKapjSmEZU1rHm1ktNuuzxgcPvw
         khf5OzGdjW5VdSjnD5+LK2lcDPt37ph8J8HXRzWLe0CjeABt913vL/hNU1xr81TBZzmh
         Suh5lgRaEiKiOWEx4TpCsM0+VVPUUK+8dJSXXxu9YSkiHhYtYietBVQDFWNlnOdCkw9O
         ZHHg==
X-Forwarded-Encrypted: i=1; AHgh+RrmSPm/qXdsPSUVsa+BHpNTruzYai5J12KMPSimMnitAjsYJ3s+WwdroNUt9wS2OqtZOYEoWyXG4WJU@vger.kernel.org
X-Gm-Message-State: AOJu0YychFYi6/zJA2b7bVf54iQj50JwGUSYnIUIjdl3qbMu3j4xjQjl
	EgyyHaVfS84CHJpGJPm4uKki6KrrNMUZ6gpRZqi/p4U8mpWvWnNvaSio
X-Gm-Gg: AR+sD11RTepsFnwekut7tipNpck6aIqIlnA0IUb7nO9bdYH6Rs3Qbe5yfQtl/xNPTPa
	WllFR8zliNsI4jCK2Y6W9ipOw1t1ZgBMrfa3Oy4zHZOScN554TE7fYX1ld8Ypt4rRTWLAZrcU3d
	HEA7ttG79AaIOxtdLlpwEhH9DI/t47VhpC07y0F2bt0CU3KD1h3uNcl4S942zZPNMXWeszY+to/
	E/bPI9pXHDwQs8/78v4MlvhmgZJEk/Or9l5Jl1fvt0KKpOYwM81xLXD0LFMoTazo/8zNN31XXnJ
	1ohuNBIj2ch/4VvkAhLUyz4KUMGOOACxIysTGHXK3oMMiKoy0k/woHi2ZO3gn0kU0y9uDwgrcp3
	svLGxp+b/jPOKkkD6OLq8I9uNgxZrjEuG9S9fu7Uy5GbPrnI+QRzdu3O7Qerb0JgAp89HzO7aNV
	5a1pn/EubD24ouw8Mu7AHbs2y9LbDqXH9k3hzYLT/EReW6ZbJ9gIIC0yi/8lu0dZjj5fWw8xDHV
	W42mScEYkDMG0vylTYrsMz5TC2sRndfeDdQIuJiPUJLce/4Uf2mq35foJ27GxI=
X-Received: by 2002:a05:600c:12c8:b0:495:63e4:7f78 with SMTP id 5b1f17b1804b1-4994e7baae6mr113674705e9.10.1786004125903;
        Thu, 06 Aug 2026 01:15:25 -0700 (PDT)
Received: from ?IPV6:2001:9e8:f131:1d01:8da1:260c:d732:9394? ([2001:9e8:f131:1d01:8da1:260c:d732:9394])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954206d72sm64914395e9.1.2026.08.06.01.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 01:15:25 -0700 (PDT)
Message-ID: <a8b34a1d-9aef-4e9b-8c29-a03c7c675c9f@gmail.com>
Date: Thu, 6 Aug 2026 10:15:24 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 2/4] net: pse-pd: add Realtek PSE MCU core
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: o.rempel@pengutronix.de, kory.maincent@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, daniel@makrotopia.org, bjorn@mork.no,
 sander@svanheule.net
References: <20260802100114.720594-3-jelonek.jonas@gmail.com>
 <20260806011110.1855449-1-kuba@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <20260806011110.1855449-1-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.08.26 03:11, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> ---
> net: pse-pd: add Realtek PSE MCU core
>
> This adds the shared core for the Realtek PSE MCU driver: the 12-byte
> request/response protocol with sum-mod-256 checksum, the per-dialect opcode
> tables and response parser hooks for the two protocol generations, and the
> pse_controller_ops glue plus a registration helper for the transport modules.
>
>> diff --git a/drivers/net/pse-pd/realtek-pse-mcu-core.c b/drivers/net/pse-pd/realtek-pse-mcu-core.c
>> new file mode 100644
>> index 0000000000000..ed3b743470dbf
>> --- /dev/null
>> +++ b/drivers/net/pse-pd/realtek-pse-mcu-core.c
>> @@ -0,0 +1,988 @@
> [ ... ]
>
>> +	/*
>> +	 * Explicit MCU error opcodes (observed on the Gen1 dialect; harmless
>> +	 * to check for Gen2 too). Catch these before the generic opcode/CRC
>> +	 * mismatch path so callers see a meaningful errno.
>> +	 */
>> +	switch (resp->opcode) {
>> +	case RTPSE_MCU_OPCODE_INCOMPLETE:
>> +		return -EBADE;
>> +	case RTPSE_MCU_OPCODE_BAD_CSUM:
>> +		return -EBADMSG;
>> +	case RTPSE_MCU_OPCODE_NOT_READY:
>> +		return -EAGAIN;
>> +	}
>> +
>> +	if (resp->opcode != req->opcode ||
>> +	    resp->seq_num != req->seq_num ||
>> +	    resp->checksum != rtpse_mcu_checksum((u8 *)resp, RTPSE_MCU_MSG_SIZE - 1))
>> +		return -EBADMSG;
>> +
>> +	return 0;
>> +}
> [Severity: Low]
> Does this validation in rtpse_mcu_do_xfer() accept an all-zero frame as a
> valid reply?
>
> For a request with opcode 0x00 and seq_num 0x00, an all-zero 12-byte
> response satisfies every term:
>
>   resp->opcode  == 0 == req->opcode
>   resp->seq_num == 0 == req->seq_num
>   rtpse_mcu_checksum() over eleven 0x00 bytes == 0 == resp->checksum
>
> Both dialects use 0x00 for a real command:
>
>   rtpse_mcu_dialect_gen1: [RTPSE_MCU_CMD_PORT_ENABLE]      = RTPSE_MCU_OP(0x00)
>   rtpse_mcu_dialect_gen2: [RTPSE_MCU_CMD_SET_GLOBAL_STATE] = RTPSE_MCU_OP(0x00)
>
> and seq_num wraps back to 0x00 every 256 transactions since pse->seq is a u8
> incremented unconditionally in rtpse_mcu_do_xfer():
>
>   req->seq_num = pse->seq++;
>
> Would it be worth adding a discriminator here, for instance rejecting a frame
> whose bytes are all zero, or reserving seq_num 0?

done in next version.

>> +static int rtpse_mcu_port_cmd(struct rtpse_mcu_ctrl *pse, unsigned int port, u8 opcode, u8 arg)
>> +{
>> +	struct rtpse_mcu_msg req, resp;
>> +	int ret;
>> +
>> +	rtpse_mcu_msg_init(&req, opcode);
>> +	req.payload[0] = port;
>> +	req.payload[1] = arg;
>> +
>> +	ret = rtpse_mcu_do_xfer(pse, &req, &resp);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (resp.payload[0] != port || resp.payload[1] != 0)
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
> [Severity: Low]
> Related to the above: does this echo check catch the all-zero frame for port
> 0? An all-zero payload gives payload[0] == 0 == port and payload[1] == 0, so
> a Gen1 port-0 enable/disable would be reported as successful even though the
> frame carried no MCU data. rtpse_mcu_set_global_state() has the same shape,
> it only requires resp.payload[0] == 0x0.
>
> The same hole also shortens the poll in the I2C transport, since
> rtpse_mcu_resp_is_final() declares an all-zero read final for opcode 0x00 /
> seq_num 0x00 and the loop stops instead of waiting for the genuine reply.

done in next version.

> [ ... ]
>
>> +	/*
>> +	 * Release the MCU from reset before the first transaction; the
>> +	 * boot-retry loop in discover() waits for it to answer.
>> +	 */
>> +	gpiod = devm_gpiod_get_optional(pse->dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(gpiod))
>> +		return dev_err_probe(pse->dev, PTR_ERR(gpiod),
>> +				     "failed to get reset gpio\n");
>> +
>> +	ret = rtpse_mcu_discover(pse, &info);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Some boards gate all ports through a hardware line; deassert it only
>> +	 * once the MCU is confirmed present, so a failed probe leaves the ports
>> +	 * gated. From here the MCU protocol governs per-port admin state.
>> +	 */
>> +	gpiod = devm_gpiod_get_optional(pse->dev, "disable-ports", GPIOD_OUT_LOW);
>> +	if (IS_ERR(gpiod))
>> +		return dev_err_probe(pse->dev, PTR_ERR(gpiod),
>> +				     "failed to get disable-ports gpio\n");
> [Severity: Medium]
> Does the comment's promise hold for failures after this point?
>
> rtpse_mcu_register() drives disable-ports low here, but nothing re-asserts it
> on the error paths that follow. The devres unwind only releases the
> descriptor; gpiod_free_commit() in drivers/gpio/gpiolib.c clears descriptor
> flags, drops the label and optionally calls gc->free(), it does not change the
> driven output level:
>
>   if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
>           if (guard.gc->free)
>                   guard.gc->free(guard.gc, gpiod_hwgpio(desc));
>           clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
>
> So if devm_add_action_or_reset() or devm_pse_controller_register() below fails
> (the latter propagates -EINVAL/-ENODEV from of_load_pse_pis() for a
> missing or mismatched pse-pis node, and -ENOMEM from the kfifo/devres
> allocations), the board is left with all ports ungated and no driver bound.
> The same applies on unbind or module unload.
>
> Since the level also persists past the descriptor's lifetime, doesn't a
> subsequent probe attempt start with the gate already open? That is exactly the
> case the comment guards against: if rtpse_mcu_discover() then fails on a
> re-probe, the ports are ungated while the MCU is unresponsive and unmanaged.
>
> Would a devm action that re-asserts the line (and the reset line) fit here?

Not added, possible failure here is seen less critical then having kill all PoE ports
in case anything in the probe might get wrong. This would even be the case if the
GPIO is asserted by default after reset, outside of the driver, and asserting this
would make PoE non-functional though the probe failure might not be critical.

>> +	if (!info.system_enable) {
>> +		ret = rtpse_mcu_set_global_state(pse, true);
>> +		/* Dialects without a global-state concept (e.g. Gen1) return
>> +		 * -EOPNOTSUPP; treat that as "no separate enable required".
>> +		 */
>> +		if (ret && ret != -EOPNOTSUPP)
>> +			return dev_err_probe(pse->dev, ret,
>> +					     "failed to enable PSE system\n");
>> +		if (!ret) {
>> +			ret = devm_add_action_or_reset(pse->dev,
>> +						       rtpse_mcu_global_disable, pse);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
> [Severity: Medium]
> Is there any compensating teardown for the Gen1 case? rtpse_mcu_dialect_gen1
> has no RTPSE_MCU_CMD_SET_GLOBAL_STATE entry, so
> rtpse_mcu_set_global_state() returns -EOPNOTSUPP and no devm action is
> registered at all. The same happens on boards that already report
> info.system_enable, where the whole block is skipped. For those boards
> nothing disables power or re-gates the ports on a later probe failure or on
> unbind.

IMO the driver shouldn't mess with what it hasn't touched before, so no teardown
if nothing has been activated/enabled before.

> [ ... ]
>
>> diff --git a/drivers/net/pse-pd/realtek-pse-mcu.h b/drivers/net/pse-pd/realtek-pse-mcu.h
>> new file mode 100644
>> index 0000000000000..52f9442d7117c
>> --- /dev/null
>> +++ b/drivers/net/pse-pd/realtek-pse-mcu.h
>> @@ -0,0 +1,93 @@
> [ ... ]
>
>> +/*
>> + * A polling transport can stop here: the reply to this request (opcode and
>> + * seq_num), or a terminal error. The seq_num rejects a stale reply left by an
>> + * abandoned transaction, instead of desyncing by one frame.
>> + */
>> +static inline bool rtpse_mcu_resp_is_final(const struct rtpse_mcu_msg *req,
>> +					   const struct rtpse_mcu_msg *resp)
>> +{
>> +	return (resp->opcode == req->opcode && resp->seq_num == req->seq_num) ||
>> +	       resp->opcode == RTPSE_MCU_OPCODE_INCOMPLETE ||
>> +	       resp->opcode == RTPSE_MCU_OPCODE_BAD_CSUM;
>> +}
> [Severity: Low]
> This is the transport-side half of the same question: for a request with
> opcode 0x00 and seq_num 0x00, an all-zero read is declared final here, so
> rtpse_mcu_i2c_smbus_recv() / rtpse_mcu_i2c_native_recv() stop polling rather
> than retrying for the real frame. Should this helper also reject a frame that
> is entirely zero?

Covered by the fix not allowing seq_num to be 0.


Regards,
Jonas
