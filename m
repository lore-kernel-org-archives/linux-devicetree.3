Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048550;
	b=EzWC6hr2PDWGqlTtKoKt8uCryOKVPN4H6a3Z92KiWO17aSaO5c5RasBFL+jTTeOa2IoI
	 gdhlXG9P0nrtONzFfR+CJYzy0k9fR1/MB0bcN39t+PCdomssEXNnFJvj2TED5SIWch6gH
	 D2aUoWuDWJ10781PM7Meqv2GL2YIzMIBgNiVT2NtpmCU+SjnXzRGJGlLwEK2XlKIPJa8m
	 V8WseEf4JZcbWhiLwzqu134axtIQSRZhYf0EqKd0T8gnapg08SodpOwdHUcZimUmzJBmT
	 bjqmiWrzwJ8UrznllOONULKOuGgWfWAxb03fnhp/v3+QRLgtkgS7Inv+3K4syH6jFng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
	b=H5YfmJs99hu38nWTjBI7zY62QNJOB9gePRxHfjRKQcW8hrmPYHfhgebcmA+9JD8zEoJW
	 FAvnQdl8MlfX+15Wz+FDOFs1C/HR+b5qRQbRnSc4yZQ8XJamif8/bDVIhzrhrchZCYWen
	 4efZSbg9XPv9+Gw0B5wW+n4Lba0NQH0GWNrhd4o7XEAh0wMeHhSKVS90EVeNn4JVctHc+
	 ZVUQOUFnWmHa2FESxM7TzzJzYHeJxlwNdATA1gPCenoxapb19FzgfpB2aHUFBIRpu1RD8
	 hcZGrqF4rUzD99CfQ5vVGq3PBTEjGcVaLSzVfl3CSWOXwqgIuusgzK7adMOkO6gTo4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754BD606A31B
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:02:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 754BD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VxewqWBw
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f3e9e431so266547eec.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048550; x=1793653350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=VxewqWBwssajqE1K/421twDEM50Ya0fxQ2dAzdBlnKNWbwpj7J17CO4utV9RQPeDXl
         G1jSBc7MExVNmLM+hg3feEcOLCYA9JlvbD6GAvfloZ514VUyF3uDEM8TCQ11nuDCtk/U
         wcBiWvOy+kvdWunLmDcJBV4+E6dByLruzRSFyUNHBbqtJt/CmVZMvaiOAjkS9D3EduMd
         OXWXRPP2slF02OW98RJIoDQ4QsyYeb8S2RlsXTdfaJzkts73/5gmTaZ8AITeuAj1IuSO
         q0e1WyHqg0eNbPrT4XlAE9VRgCzt9CfononI4rbBfisAPukqf/g/rJVbu2EIanaY7eH/
         mDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048550; x=1793653350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5mYYH6ztXAGlslcRFjxz9nzyFLofC1QN+/Q6baEB84=;
        b=myR0Ek6CPhbl9XqnQUlLhxuSwyiIeHbvweaeCv681d3WCGFcCQwXyRi3NGNTMAr0iB
         98w1VCVpG0dGvGNi1eYaYcnXe+MJmM0SGUlNY6OqlPQXTx4uwPMOCuHlnfkZZ7nogTAb
         E8flW13xNK93qYJ1s7G/EgNTmdNMcNnkz9PDbQCovgp/yqNZIjQStzf9c0cZha85zBSD
         xhm7IRCgX0KjW6WaiUfRtb5tfjfUVApFdZ51NicVCIuMZLiKc5c+8DGEkxmvf7gODbW5
         YkujTTBFXbE+nvPlaYL50r6Wt5m7Nra9HvDdn+ngKjSApcn/QM6QwXsTzmWRJScZiNq1
         vNxg==
X-Forwarded-Encrypted: i=1; AKwUvBxU7cdN1Lgz/VtUkZ+xJ8QNgyGI+dzzV7d0LPV0jlsAQXlXm5nG1jyomwW75BvhXk6r+46P4wQ23Z5f@vger.kernel.org
X-Gm-Message-State: AFq9FYLT1EVzqTLs7c85KGPdxSxPyHdaNt22bSWxz/V9FynbdH6H+ff9
	yMVXQzneaB+wQ64Ccaa9VK3VcxMCe+TKq5Bs6f5hMhjBoq92523z2k3d
X-Gm-Gg: AYBFou07yWy8gn9OOWjPVQiQVtHV+1axeG544Ir3Mod4HhTeFswbxpoZWoZOVbNcBAG
	dynuJIj19ury3Wr34j9+4QJj/Ilkdg4SKkzQ9vxMbYSXRTSto/Abc6cZLMvp3/mLBGMyoFDyc+7
	pPT2rtrI+6fNQYAP6wMRbBe8qfqc6WuTcYXC9lkN2SXiCKZJ7K4vOmaK+/I4vgcGxbfiEAVJWvQ
	LwalRySDmbHg8u1lZhZjbFD9hhafAr46A8FLNJUI1LTXxVEXtCqlCbvgYS0MWeLKf1cEC6ANsjS
	5tDNQN+GQC9H+PnQLzAgjdg+sORWuXuhBhlgN7tIPDKt1YmoxFkgDSLhO4LRdLqPIB7hwqrwdru
	z+PHM7785UQin71o3YIGXlpwhndakGWcE1VwVGr8KHFcnGxeZUg8XTkBjndIjbZC0bW16djnvVx
	T2dNSGsx0dfESE9EMVEgzXrNazBuoHLqmrX5zvgi7Sn2+qNhmG2GEzciEToLyVy0HdQWRNoJ5gw
	a0ymVAG6WbZdpEXKIuVljwkWWA8ylYwKWfs3C2O37zl3Y2SeBT36Hj8otvcVRdMa+dWjbW06F8I
	fO3yFQU601Iv8vA=
X-Received: by 2002:a05:7301:618c:20b0:369:f1ca:5b24 with SMTP id 5a478bee46e88-36a0f52f51cmr959274eec.6.1793048549375;
        Mon, 26 Oct 2026 14:02:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm29394389eec.27.2026.10.26.14.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:02:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 14:02:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (starfive-pwm-fan) Add PWM fan driver for
 StarFive JHB100
Message-ID: <ddf7f5b4-9166-443b-9105-807f77307bb7@roeck-us.net>
References: <20261008071950.4772-1-changhuang.liang@starfivetech.com>
 <20261008071950.4772-3-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261008071950.4772-3-changhuang.liang@starfivetech.com>

On Thu, Oct 08, 2026 at 12:19:50AM -0700, Changhuang Liang wrote:
> Add PWM fan controller driver for StarFive JHB100 SoC.
> 
> Fan speed is controlled through up to 8 PWM channels supplied by an
> external PWM controller and exposed as pwm[1-8], and one PWM channel can
> drive up to two fans. The tachometer block supports 16 independent
> inputs and reports fan speed in RPM through the hwmon sysfs interface,
> along with stall and low-speed alarms.
> 
> For this controller, the special clock and reset operation sequence is:
>   probe: clk_prepare_enable() then reset_control_deassert()
>   remove: clk_disable_unprepare() then reset_control_assert()
> 
> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Applied.

Thanks,
Guenter
