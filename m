Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFFD1A9F87
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406067; cv=pass; b=dAVqBiqhUkrsGE89Ih5UMZM+QnJWn/NNF44SKxfUhqL+j2csdXM3/IP3q9+mZjtUNLbTxqBjRfFINO+WGKOE/y65tDgvJoLqIwZiMVdnAZMgF1UOnGbWJLxCThkCDhomXImXLcI3VzolmVLKBWJ70v1DHfi3sKc8pRcdWr1wA8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406067; c=relaxed/simple;
	bh=XC8lLB2PyVdmlOd/l8+hItdF3INS1maKBGj8wCLhcWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lT4GwIpVTZdLOnY150x3LL+SNqZLkhgdzfcEgu/wkgCkLlGhHjUrQa8c+uyzH2Z7Efmh6Awn5lO3r4a0korCGUqeFO+nnzGEFTtM0CiZwBOjjKnPpFZ17EO9vj8mpm1Xm/d+DvD0Hq54YJQLg8JhtD5dRKUFBwTrvAmiz+Cynrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtS6JSep; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtS6JSep"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-691c5776f95so2685195a12.3
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782406064; cv=none;
        d=google.com; s=arc-20260327;
        b=esKlhV4TtqHontm28ck0QtuqeIrbGEOkt0A14G8hLGahaiKdYgrlSiE7UA58nb0HAi
         9R68TlAoN6ps8FxFZdtoCm3bZ4djgzzC3J0yrNSeuLYz8h85NeuoNQE+aQQLSUosyxx1
         ka41pqyPN7NCxQ2KNPePDc8hRNiXZPHRHSvtqKqCRcpjaTbIa76x8FeupQFkdnhs0OPp
         FTVgAW+R/DVWZW5w4SzynbKwudxE05XkpBOYugDPOSumvrkHTz5SdLNXAAA1YXUq/axY
         PNeIHZ8NqZOAnmbGl7P9IpeX85ap3l7qifsnjW/0BANFvTofVm+5EFLNGv8qJV1jusl3
         5VBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        fh=53kuICan0LNuNcytXupx3yKNKMHVsyt3lkm3n94nMMk=;
        b=XUcF+2ruHJr+v5WBspigaZQcOHE/TD/uKsj0hq+P10bY7QxmZC5TUAzsSSou0YM7D3
         Nvg/M2HL8t5Luo0fLZYupgxrR4YcMCiFwBZ36NnXJ5icOM21URaV71koDagsPFPvv4IB
         KS8ggWQ5RNePZ9wUZx+ROmMmy50GIW/HUX+VxvYXo0Q5KltX2DfPDvLle3U5jQIMCY4r
         VgsaJYIb1q0+LoF6HCa44psiWY7tf73wKL+jfw077dr2MInjs2mKKK3cH/Fs9srIYF3q
         eMVjbY4IvJBS58A1jIe4teT3JhSDhLwG2hjTxWCkEWGWC0CCgn/EXN5PuiHW/NEz2anN
         mMzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406064; x=1783010864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=TtS6JSepNObQGxa0F0SCFMdMY6nE9QZmYbFaodt0O3WSYWhlV3k0K+UmQLJpqgCXyl
         gIvddoLn12HQfJpYafyaXCircv6NCKlKocdj8HZvs/6mYaN8s5+cT0g71u4V7wJkqf2G
         hMGA04KJjx5Vv+SilAjW543SRuYPrxgCikjJWb+8iWjUOr/+AZXOdrKgnoX5TGpUdwh4
         JGpQMuqHVPvlwRzRLx21zjXYjNDdKw0Pdva+yRzw3+dq8POrIiE/fXx4/KsAagWLCOF/
         gcKrYwMp3ykpVhbhr1xoo35e1ClklLcehOkPwmfpckOK8yXLNxQ/HhfFMqNS3rUyXaTy
         qh2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406064; x=1783010864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=UvTEKdB7E4rXjEZItnlk9gzxNYWlsbQL2G54znhKIS/uVjx9H67dQmX8pNp4pL+I8F
         is1PkFZ2gUY1ts+M9OSXYHdUaqAxfg8cWbVMeb4VCuzCMNTiCwysbBjWbhFDxQp9zMnn
         d5Wm0IeocLxUYrA0ukaM8Q6iz/ZbOwk4sDdUSTsbyw/8TDEAZLDB3tlW9mrKkK9BVUhr
         l4VVyFyMnw6TAcXR4/4pqVoYQyggH56RYmpwZYFFVadTeuS1tjjs3bSTCIl4wGXhoomd
         vQUY9LCI6CNgSENYPJlXtwe3R7j/1WhLVb645RG7DawvHmYcBmiWjIsmBbHqROHWBJRD
         E7Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqGN8AvLzBCTPSnmHTbqyTxPLQnmgzj0YVEFtJ1iNjM/DhLr3CM+cBvrKXemvclPUZ7o/BpNOzYViNq@vger.kernel.org
X-Gm-Message-State: AOJu0YwO7Ls9tC382JZSSvqi4uLt8hjh7+/DRylipU2+Yuv1DCM+Ul4T
	P1onvhhM71Kj54sJuMYoWtwzYQSlg0wCKDzfBVGBXx/ikJZB8veDzEwi/Vay84xRJ1zk6RM8yQL
	cWeu4VCR57oGxoAOYbWJazq4J7TRhM4Y=
X-Gm-Gg: AfdE7cntfieXReBQ2c59Zkcs0kkS8FWCvtEXXSxE1v5hUH4+7wy+dytpIbmVwvmg/wI
	CAzcnXOXTt0QOWlSZ1/aRztLSM6Ob0PHUlKBqN//Y8ytVOIvWoJPLIej8oy35sQCnKTXrKou9HL
	F7jSXJ+qteACBQ9YtSy3lrZ2Q9nfgRrwu407xfxxgY/1WUrdxj1v2Iv2AqI9jJSXtfMsrE/I8c0
	YWe1FdiKBXHrFS2SM16/SugjlIwkknPZ7x1ByaLZCofvLf9sieMbsFPVQlRWvK0DQVvS5XEP++Y
	YkZi6Z03UppPxVAa/9ZCWQL7UEJu
X-Received: by 2002:a05:6402:42c2:b0:697:b72e:b909 with SMTP id
 4fb4d7f45d1cf-69810af080fmr119797a12.28.1782406064192; Thu, 25 Jun 2026
 09:47:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
In-Reply-To: <20260625-cameo-siamese-cd78c349519c@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 25 Jun 2026 18:47:32 +0200
X-Gm-Features: AVVi8CdQlZ_mmiW-bTGe4tmL6GeOR-G22Cpv-MM6leLml97_0sYg9x0t3Mjq9gg
Message-ID: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

> I've not done a very through analysis, but this seems like a massive ABI
> break.
> The change you're trying to make here will mean that new kernels will
> not work with older devicetrees AFAICT.

Correct, that's the reason I sent it as an RFC (I mentioned this in
the cover letter). I am new to kernel work and I'm not sure how to
deal with this change. On one hand I am almost certain now that the
upstream driver has never been used in actual devices, since the older
code was only partially merged and also, as Sashiko correctly pointed
out in [1], it had serious errors when matched against the data sheet:

Sashiko:
> Does this configuration cause a regression in pin multiplexing across the SoC?
> The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> register. By passing 3 as the width here, the framework calculates mode
> offsets using 3 bits per pin. This causes pinmux writes to align with
> the wrong bits and can overwrite the configurations of adjacent pins.

Data sheet here clearly shows 3 bits per pin are used to choose the
pin function.

On the other hand I know that breaking the ABI is a big no. But what
would be an appropriate solution? Maybe duplicating the driver with a
different name, something like mediatek,mt8167-pinctrl-v2? Is there
another driver I could have a look at to learn how to approach this
problem?
Sashiko also pointed out some other minor issues with the register
maps I already fixed locally after confirming with the data sheet, but
did not provide clues about how to solve the ABI breakage.

[1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kernel.org

Thank you for your time!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
