Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5293A640A
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778666996; cv=none; b=A/FCpIz9eUtXC05O+vyeBIpKVQpSSZqr8y055DYlqAfRXBubyQdoDDxsNoXD7Qb1XmxDu2On9xciEvmaJ/CZ6ABUCRJRNQ5f17pYuAq16yfLEJ2CfGMjK1OR+RG/Zx4Uc0e3PmyHlZ1oawfPqmeEwXgQVvmLrqkS6EHet01C1EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778666996; c=relaxed/simple;
	bh=dI7Vy4tSt+ipoY1cvrv4SzZXvFAstFFCphZE2K3dz3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZ1qFnVbdE1RkBYymPG8UXB1TxcyMGQqtFWW/PyaFuWM6N7EnOQt+iYUClfn2pIR9AdB3f5j2KTh7msGajYF/rsF85e91hCmgwaiwQI11riW38IfMzEnVeC12/LF1wxzCOpR9Vj2jaIli6Udbl+HL1FbIuv62W62DrsarsE/SGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rlFLZ/ly; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rlFLZ/ly"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6763cc8775cso13354916a12.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778666991; x=1779271791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPWJdSc2I6JXF+VrIjabBYnBXUVNyLPtG2ThRSxbw6I=;
        b=rlFLZ/lymCTUE59oMDF22xJoc/GrGrm86Zlf6fzn5pfdHOBtZYv5C5S7va59i5HCYU
         eDre+qhAloU5M3bjSi7iIn40fIgYw2PkYdDDQiOZtYtBeGSSVxlzfxO8NfpiFa9m55sj
         NcMoNt1vHhqltVi+sE0euhgDxgGSQadA5hB2YKgrV0XB0FsrJcDFjIPAsIwaeWxR4X7+
         /LTGVKsdHFKpTlXwGPyV972awoouVeOoxVhD5tEypphE8hQs4XPftOHVBYoRFmSHAkNO
         VwkPzoaUnnKBZGQv5qH/t1W+JvdxOBZ0VPh4cRq/rfIXP25Nvemg2wzoXjkG0kjAYnvZ
         f+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778666991; x=1779271791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uPWJdSc2I6JXF+VrIjabBYnBXUVNyLPtG2ThRSxbw6I=;
        b=ccWdgUsq3b0GSgAFcGqi+txf2+2u4OTGtZuV1Y4Jxsf0Cz+7BF2NESQqJMqhG0Gu8Z
         JxCzGoWBDd81R7Wqd2ovOJj61r3t9j3H0pDwpZjCfnNc2/Rdzxwttt6eXMdgyDZ3bYRE
         EXMa3TV8gPKMrlb3pBhWb2l2atY2guBFXBulZYwKz/XaLj50w0beo5meHuzIj1Qas4zq
         YLWJTp52OrNkXNkXr0e16y03jGWMhvYQgfOX/U3zUGN53ggPOBb1fM66GzPoUM2Yr1j2
         FZKVucOzvxzs4CNNG9a1IpME29fKVzbNrNs2A3XfJfw+NkchCXb2r6JiSZEZPQOoODZA
         c/LA==
X-Forwarded-Encrypted: i=1; AFNElJ/p4GgT2EXKgQe8sbpFfNMVvOQHmwUmBJFBMJO4APGPK0uQlbBfU9+hrHzq0ivoWbZN9it5w/WbuRLy@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1wbxuyBhxF/F1RRwyIHpqNew7Hm0GzxK256esw6GI2lS2X9E
	scJHGKRicpzxRlBnAII8f/G59jDMQw+fe91vE0PlGSkrYaWuuc1XwMmz
X-Gm-Gg: Acq92OGmh1UBV/9T1n3ZyG/Q836fGAyaxLD4b1v60Enr5ljnwawlzEEZtIvRv11EL+7
	t0Z/8aE+yPn1830JAO5sztpZfkrmAJxvxHeTJdB3okZHF+SiZKka8378HHTi00h+8iJwNl7ePy2
	Nl2+jRe4xM6LIVIaGorySpGcxNcUspqDn8A3dyHnmMC1NUpesk2FniEOQ110ioOBya614YFeE59
	fTt4q3moOELdsD5V1dqeX7Nb1w3ju2vwyB4Dl6ZCJDQSpIIQWOrnmbn1dd3/xEE0WmDJtj5tyID
	M5XlbuOuNlEVkI+NLWb1GetDDC9mTwRWPpDbyWtMWRPvQ0iYw7pW4FRXTAeTskntlRZ8s9Louj3
	tsT1GQED1qiEFjM8GOSc4nWlrAPI6p1wab1eKfHF0Sl7JsutKniENBD8NmOxFJ9p4KC0Q1/fNtD
	GWUFBEQ1iBHyeofPiWAkmnp/feYUUn0Jtr7BCM2bsehBmt+Vt5+AgJXdJzuS7irC8PzbLxzik=
X-Received: by 2002:a17:906:730e:b0:bc3:99d5:a29f with SMTP id a640c23a62f3a-bd23aa18252mr420029866b.5.1778666989980;
        Wed, 13 May 2026 03:09:49 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb78493d1asm727760666b.39.2026.05.13.03.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:09:49 -0700 (PDT)
Date: Wed, 13 May 2026 11:09:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Rodrigo
 Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>,
 rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <20260513110948.16db5243@pumpkin>
In-Reply-To: <sqt72hd4xdu6rj3zecvcpo3bbfsxlh7u4bi76enbq64hpgjm3t@vksuk4cuo76x>
References: <ur6brs3yjzyb4mtelabmcglxjltddqvjxtgl3lkdkmbjlkmnsq@bwd6rz7gided>
	<CAHp75VeoH3yVfp8NWjKfc_df0VRLkyf_SK4e==-wJOEodVjW_A@mail.gmail.com>
	<q4rmlkgecvztnvjg7b7wtqyvhdy7uxgaouvhae2mlsxaasasbf@dfakp4m5l5sl>
	<agNfqiZpGZAM-x_H@ashevche-desk.local>
	<ru2h3ip7qf6j54dlrij54nwp45uyq6m2e6zspt6v6eynpsagqq@eo5v3yparuhh>
	<agNnfWZa9_NyLoWq@ashevche-desk.local>
	<bc7mqfgll34vyaxdtvfssgypkhyx233wd4hxfzu32rddxnolaq@rd6c3z6yu6aq>
	<agN6onIAwG1yn5p6@ashevche-desk.local>
	<hvwyrb7g3ar7hzesj32zoxzqvjmdtwybamy4zxepqdbu37qvog@xnmgqhfya34f>
	<agOKq0iH2CHQ3TIg@ashevche-desk.local>
	<sqt72hd4xdu6rj3zecvcpo3bbfsxlh7u4bi76enbq64hpgjm3t@vksuk4cuo76x>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 08:14:28 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 26/05/12 11:16PM, Andy Shevchenko wrote:
> > On Tue, May 12, 2026 at 08:39:21PM +0100, Rodrigo Alencar wrote:  
...
> > Oh, I only now realised that this is sliding window for a single 64-bit signed value!
> > I was under impression that you wanted implementation that covers 128-bit signed value
> > (with 64 + 64)...  
> 
> So that was the initial approach with strntoull() with integer and fractional parts
> combined in iio core. At that time I realized that we ended up combining them anyways
> with:
> 
> 	val64 = (u64)val * MICRO + val2
> 
> so why not have val64 already! And all this made me realise that once leading 0s are ok,
> scale can be even bigger, e.g.
> 
> scale = 20
> 	max = 0.09223372036854775807, min = -0.09223372036854775808
> scale = 21
> 	max = 0.009223372036854775807, min = -0.009223372036854775808
> 
> It might be a sliding window of 19 digits, but here we trade range for scale, precision
> is still fixed at 64-bit.

I wouldn't worry about that case unless it 'falls out in the wash'.

> I have a new idea to make thing simpler, actually
> it would go back to what David pointed out in the past.

:-)

-- David

> Let me put this together...
> 
> > > I am not representing -0.9999999999999999999 as is. The desired scale will have this
> > > truncated. It may be -0.9999 or -0.999999 or -0.9. And this is practical for a
> > > reasonable scale value... for pico and femto precision you still get a decent range.  
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> > 
> >   
> 

