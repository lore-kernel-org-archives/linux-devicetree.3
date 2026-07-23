Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316F64734E9
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826434; cv=none; b=YlPZWqaXvMD0goAwbLi3h/ODx44g5KulU+9H6AKviVUIX5FZ8damNgLaRKg+MKX+0Tk+YNsSfkW6WsfRO499AQuZF0NP86wfzBGNzosVRDwbGzS1SRkPT71MpFBeFYcPHao6EtwVGPoTqou3lJ608+SLKiV4dWAoRolVPalsLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826434; c=relaxed/simple;
	bh=9BGi4xPmEW1kSjxVW00UAzBCZsYKa/tallJYYlIDz/E=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=JUyOJGCYrLYcgrX17GxrJp9QFVvR4dfRQj3cRpkTqpMAYY6aJ+n+blkMz4Lydq95xusYoD4CfkbUvimQ5py+imurkMFKfHqqTqoZ1Rj6/0lCBJpYYud0ihV7WftY2BwwOaNDESKfylfq53p91LX7sjzj4Y7teVXd6eVMGGzKmMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=a1zTeU/Q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="a1zTeU/Q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so815078a91.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1784826426; x=1785431226; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9+ctXvaIYkWeE2h8F1u4b7HT7VEBp0edXmBTu/xkC8k=;
        b=a1zTeU/Q3F/vEEHNScQtJmgTRME++Rr+14e6JoWbuMjshAVrEE9prW7yRPXN+2f9ae
         UcMx2leMFLl0AL5dV7FqA9tJ542awxJP7gQ966lYfHU+MiHAYtMEN+F85SF1yBvqcpYg
         hYicN+T60WeHQSpcWdpaljnt8SK0zFho+4HPZ9IrHg/q4606wtlXYk7mLmWM4O+rV41u
         L9QTk8BmJCiSM0kK4TU/1GryE72JgbynbqosdcXX0+Hp/uUySjNlYHoJcMhj1a1DLvZ4
         vGqCoPqESDrsmpjvdN5JwnCJJlmhFBONcC4UIxpS4altTC6+VNmSw7sGXi23IQu2skgP
         MY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826426; x=1785431226;
        h=mime-version:references:in-reply-to:content-transfer-encoding:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+ctXvaIYkWeE2h8F1u4b7HT7VEBp0edXmBTu/xkC8k=;
        b=irlbbzS70iJva+GGgjQ6WpwC7r/9MuMLl/z1XeymZ7begb0W46nmwnorq0c1aMhK0s
         w+nfMMV3J/PmCK35rWa+4eQQ4cZev0FHng9c/leNoN/UQ3PkoZBwJL9dxqkG1u3HSraB
         v3nx2AzSX18gEJzVPUsHXa0RZbHiQ/r/pbbK55WiUxNW6Mot5q7S0/1Ah3C1VAE1nKpG
         zPGeKaKokoIYUABh09LFNZIc6u/Dj+/ZPC+iXMbxQ6J3ZdjCOP+wZKQHAYYlN2sTeOEB
         wkiLBx5mS4NPtAGu0Y5NgKyVzg8hxk51Syp36Z1Oye4ERdeFCnpKwxXSFpfr6UCPiXNq
         cgUw==
X-Forwarded-Encrypted: i=1; AHgh+RrZCI33w4aFKPiFwlHhNBoxl5wjXlZLykHPI7TYlN4Y4yBWp1Z2qjcxlmhL/sVbtmiWeDBkb1e4gtIy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4Z2awnpgVzjl35LPcQs6FQ4JcISlLnTGXYzEZPI9A1A5fxKsK
	/MQ6dvzF/mI8JnCRuwdwCzP7nUhyFXB1DHdzDob5TzSkDaxT7EYg4qSdptiEWtz6MMA=
X-Gm-Gg: AR+sD12S+0ApM1t5L35Ym1oqyN5st+WwK5pyZ1VgzLU0FFI5paAmVx75wxWaVJl7jxE
	qewAgsLI2tF3vn1UgYBI6ZJWPNo/n3Ajg4+RMXxCv5woNulaLFQIjAEdwp+NWAWvxgpj3BTBXnh
	qDwZxaCdSofYg0O4Qg3bxDdcinIXv4RWegFPuCugMQ+RpNcm0XxjD9nw+L7xhu8qDXxK8izWZxN
	8rEBvRxVPkEBi1jkkg5C7TJ959X/m1DflqSILUJnaXPM6wYTD4lc/ZjmVMsduAvRphGAGdk0YWf
	IwQyVv/FaNoqYeZvuLcHL9AzWP+4aUyyXxh1D96pl2h6eXIHJkLsKzMrGIP5eeWZCcnFTKv6a0w
	eew7VJ6d80F+5v+mRQbGkdSOQPly6D4/o6klLaahlk+Wmj74coHLuHfZuTtY3gLEn8d/lXKHnhE
	uh4g==
X-Received: by 2002:a17:90b:568b:b0:38e:7d77:2fbb with SMTP id 98e67ed59e1d1-38ec6631f60mr4017014a91.32.1784826425522;
        Thu, 23 Jul 2026 10:07:05 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041b8be9sm170294a91.14.2026.07.23.10.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 10:07:04 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:07:04 -0700
Message-Id: <DK645VUA7PK6.1B2M1Z5TGWRB2@nexthop.ai>
Cc: <robh@kernel.org>, <saravanak@kernel.org>, <frowand.list@gmail.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 6/9] of/overlay: don't create "//" paths for
 fragments targeting the root
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260723033553.1261D1F000E9@smtp.kernel.org>
References: <20260722-nh-of-alias-overlay-v5-0-2abe2bb9cdbc@nexthop.ai> <20260722-nh-of-alias-overlay-v5-6-2abe2bb9cdbc@nexthop.ai> <20260723033553.1261D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue Jul 22, 2026 at 8:35 PM PDT, sashiko-bot wrote:
> [Severity: Medium]
> When path_tail_len is 0 (i.e. a symbol referencing the root of a
> root-targeted overlay fragment), wouldn't unconditionally clearing
> target_path_len result in an invalid empty string "" instead of a valid
> path?
>
> If path_tail is empty, should we preserve the root "/" target?

Right, a symbol for the __overlay__ node itself of a root-targeted
fragment would come out empty instead of "/". The next revision keeps
the target path when the tail is empty:

	if (target_path_len =3D=3D 1 && target_path[0] =3D=3D '/' && path_tail_len=
)
		target_path_len =3D 0;

The other two findings are pre-existing and tracked in the cover
letter's open items.

Thanks,
Abdurrahman
