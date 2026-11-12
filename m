Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794502288;
	b=jRxUHP3oZ0nsfQMlLAYeY8f9jUnApbMtxssGjXjeZFOXLZ2iiteRF+/WE5jt0kyi4HrC
	 fupy9CnGzRSgyVCy+xPCUsxBai2WFIyJ8wAvDkawbN19wO9DcbHZwJl6z9+wW6lHGDtq7
	 GYfe91sjhgN8EPDSS/dHt/oF1f96dMQQOllYVeofACXaPR1wYCzl02jDVw2iW8kAe8jgg
	 +jmyw67zRSO2x9sqBMqY4OY6iCWBDf1NnGNzx3a9JqIFCKZ9nfQEHSFJLBeltFkAlp5ue
	 ewfcEzQdeNNwCrrEuOwPtYAtAJz+IHyu+PmxJbsK17eKyU4W9ZS40bhwlGCTCwttnIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502288;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=IUYx1ryaFcOhRC7CT6PPTGtMKutYpZxgmgvznkxsHHs=;
	b=h+ebg0BMKlwDUYmqkydEYvm2YgM9/GJ6yS5pPs/YvXNI5BQ45O1LcTxq2C+c4qOBUK6k
	 KsRzOK3/uxO2XNzwmFV/57lDKt+Ja2aZfAolDXbDfINCOqOK0SJ2yqyKS2VVYRKqWs/tv
	 oVzjH+MRP9tf3pcCffxb5lScV6JQ7xum3aersjOow24/TAQa3DToeZqoLvJDcKst0OATY
	 747mz7TuEdahVxGfCo3YY+QM6tlkEIsBFJotJn9W4B1BDsLyXmVuep2EZqdRfIyMpAEIP
	 gmWffnrK2Gcgsl56FTbnVYdywjimLn9MwpvwU4bJhiKmgT/yb1Z78Kf5fkV1NSQx/Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pigmoral.tech;
	spf=pass smtp.mailfrom=pigmoral.tech;
	dkim=pass header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=Gdt7i+KD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.15
Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5910606A331
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5910606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=Gdt7i+KD
ARC-Seal: i=1; a=rsa-sha256; t=1794502231; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=maOHPs6F2UQN3FyMSvwjKH2aoNIYU6UduSCxl5C72Qlt2LuMs2lEw5OyKqmWijLfR0akev+RkbxxAzw+H5hQAXgnrfS+9DSWlPhCvuSjwVtUUgP8H5VenhvNCHBbUvEQ/8lDZ5Zgsf3/cvX1/kF8ZXLZRF6oA+5GcUzK+imZnh8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794502231; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IUYx1ryaFcOhRC7CT6PPTGtMKutYpZxgmgvznkxsHHs=; 
	b=A1rF+a9IompPgnBvmSEBL0/UwlXJWbe4caGQuThtx87spBMMhfGwMTfZs7EvdNlfJRDHfVRCvH0t01zzLiCoj2m853o+GSLkHM6D62GsV/HgiEuQ6rgBrS4lTRCTHzSRnwRVGev8c0ns9JDyyoGvyYRotqF9SXuegSbbfNkP6b8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=Gdt7i+KDFjwvAuPQRuygqQTfMMPSrWWXSvz01PNDrFz64+fwIDAEhyt2VUrQKaPbhLU21aZ6F9a2w6eVMg6LQ2/dP8r3TgXKJn7e77UNZd3bxbxLhru4gEQI/LmdyTe1P1Ty+e0fnkmTETKdSE1AN8Q3LrJvEbA4q2wDbaVv2hQ=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=IUYx1ryaFcOhRC7CT6PPTGtMKutYpZxgmgvznkxsHHs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794502229431494.58873133013753;
	Thu, 12 Nov 2026 08:50:29 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 00:50:20 +0800
Message-Id: <DMTDY3AW6KQF.17C2LVU6RHJOA@pigmoral.tech>
Cc: "Paul Walmsley" <pjw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Anup Patel" <anup@brainfault.org>, "Alexandre Ghiti"
 <alex@ghiti.fr>, "Thomas Gleixner" <tglx@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Nicholas Piggin" <npiggin@gmail.com>, "Michael
 Ellerman" <mpe@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Anirudh
 Srinivasan" <asrinivasan@oss.tenstorrent.com>,
 <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 4/7] dt-bindings: timer: Add RISC-V ACLINT mtimer
 bindings
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Joel Stanley" <joel@jms.id.au>, "Conor Dooley" <conor@kernel.org>,
 <inochiama@gmail.com>, <junhui.liu@pigmoral.tech>,
 <aleksa.paunovic@htecgroup.com>, <chen.wang@linux.dev>, <dlan@kernel.org>,
 <guoren@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261109051050.105623-1-joel@jms.id.au>
 <20261109051050.105623-5-joel@jms.id.au>
 <20261109-jester-zestfully-a664203cfbd1@spud>
 <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
In-Reply-To: <CACPK8XcnPb9oMQq4YpNFG+RznroP-647E-_O5j84OW_YQ7P=9Q@mail.gmail.com>
X-ZohoMailClient: External

Hi there,

On Wed Nov 11, 2026 at 1:04 PM CST, Joel Stanley wrote:
> +cc people who might know more about the various hardware this binding su=
pports.
>
> On Tue, 10 Nov 2026 at 05:59, Conor Dooley <conor@kernel.org> wrote:
>> > +++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
>
>> > +properties:
>> > +  compatible:
>> > +    items:
>> > +      - enum:
>> > +          - tenstorrent,atlantis-aclint-mtimer
>> > +      - const: riscv,aclint-mtimer
>>
>> So, what are we doing about thead,c900-aclint-mtimer.yaml?
>
> Once we agree on this binding, I planned to submit a change to bring
> over the devices that implement the common binding. I can do that up
> front instead.
>
>>
>> > +
>> > +  reg:
>> > +    items:
>> > +      - description: mtime register
>> > +      - description: mtimecmp registers
>>
>> For example, I note that you have mtime and mtimecmp in the opposite
>> order to how the mips folks have had to add the mtime region to that
>> file:
>> https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htecgro=
up.com/
>
> This is the order OpenSBI has used since v1.0, when support was added
> about five years ago. It reads mtime followed by mtimecmp when there
> are no reg-names:
>
>  https://github.com/riscv-software-src/opensbi/blob/v1.9/lib/utils/timer/=
fdt_timer_mtimer.c#L79
>
> QEMU also generates a dt with mtime followed by mtimecmp, and without reg=
-names.
>
> The MIPS ordering works because it specifies reg-names. OpenSBI uses
> reg-names to parse the reg property so it would continue working, but
> u-boot takes index 0 as mtime and ignores reg-names.
>
>> > +
>> > +  reg-names:
>> > +    items:
>> > +      - const: mtime
>> > +      - const: mtimecmp
>> > +
>> > +  interrupts-extended:
>> > +    minItems: 1
>> > +    maxItems: 4095
>> > +
>> > +required:
>> > +  - compatible
>> > +  - reg
>>
>> You've also not made reg-names or interrupts-extended required.
>
> That was intentional. A mtimer device without harts attached won't
> have interrupts (opensbi supports this), but I haven't come across a
> system that uses it this way. I have no preference here, what do you
> think?
>
>> I think we should swap the regs around and make these two required at a
>> minimum, but also "initialise" this file by renaming the existing file.
>
> Bringing over the other devices sounds like a good idea to me. And I
> appreciate the spelling.
>
> The nuclei/anlogic boards document mtime[1] support:
>
>  - nuclei,ux900-aclint-mtimer
>  - anlogic,dr1v90-aclint-mtimer

I've tested this on DR1V90 and confirmed that the value read from
0x6803cff8 (offset 0x7ff8 from the mtimer base at 0x68035000) tracks the
TIME CSR. This confirms that DR1V90 indeed has an mtime register at that
address.

I'll follow the discussion and update the DR1V90 DTS if needed.

Best regards,
Junhui Liu

>
> K3 has a mtime register (at 0xf181bff8, by experimentation on hardware):
>
>  - spacemit,k3-aclint-mtimer
>
> MIPS has it, as per their patch[2]:
>
>  - gf,mips-p8700-aclint-mtimer
>
> Note that MIPS have mips,p8700-aclint-mtimer in opensbi.
>
> T-Head has no mtime[3], just a set of mtimecmp registers. Sophgo are
> unknown, can we assume it is the same design as T-Head?
>
>  - thead,c900-aclint-mtimer
>  - sophgo,sg2042-aclint-mtimer
>  - sophgo,sg2044-aclint-mtimer
>
> There are two options for T-Head:
>
> 1) Leave it in its own binding, because it doesn't have mtime registers.
>
> 2) Use this binding with an optional reg property for the mtime
> region, which means putting the optional part last.
>
> If we go with 1 we can preserve the mtime, mtimecmp ordering, matching
> u-boot, opensbi, qemu. If we go with 2 we put mtime last and make
> reg-names required.
>
> The current K3 and Anlogic current device trees would need an update
> to their reg property to describe mtime when adding the riscv
> compatible.
>
> I lean towards 1 because it reduces churn in firmware.
>
>> My ~assumption~hope is that all of the devices in that file have
>> implemented the aclint spec at the -rc1 revision that we're citing here.
>
> (-rc4). Yep, we can move the majority of the compatibles into this
> binding. The T-Head family might be the exception.
>
> Cheers,
>
> Joel
>
> [1] https://doc.nucleisys.com/nuclei_spec/isa/timer.html
> [2] https://lore.kernel.org/all/20261103-p8700-dts-v2-6-3ac5d49f2c37@htec=
group.com/
> [3] https://lore.kernel.org/all/IA1PR20MB4953D36ABE26822B62415500BBBBA@IA=
1PR20MB4953.namprd20.prod.outlook.com/
