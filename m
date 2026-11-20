Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170593;
	b=cax0zDNAChIHYOXNgTEoXgWSunVUx8rFPst2OJLkhrnLVS2Wsph06EYqEN1nSVk9w7ZI
	 meb7QQSGUwra/O/V4W0Z1hR4KO8zB3dSmjTe1Un8Q8E1pLHjMrD+rXQRIqKZmJwdHEuhS
	 C3rkin+ViskLTAtKNJKiz/7ENkVV5cC63yzaHSK15351MMdQ0OAETzDzlkrkeuJQ8dySi
	 zD9R3ZL89qLFYvJrjg05GBYRx0JwUn03gALI5KuTXkUrzBpfO46B2JJV/ELf56BhKi/MZ
	 njxw9MVnjwQxOUt6kjbTm9rDhaks7xQKDPZNFqba+B6vMt7JwbZanmc7+FQKoETgBBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
	b=RtUdjKpJaM+HX3AWHc8CHdS//xeD2T9C3fV61gmjPTbwbxMQkA5T+p3cbfLzYl1sMCdc
	 yd+EN69xq4y+dfWy5SFwTWrT6RGZ53l0Src8kOc+Crz0I5eojm6p0w46jLrWCfZEzUkVp
	 GgHqYj1rhFT16HGoR8nMWwBdXOmO1pk21pEVnQxlSe/jGgFKKk1w6sWZEQzcsTHAxZYH8
	 jI/sYHPaU032jmn4m78CsnUgfA9r5KRAaUv99FwcC2MR7Z8Abfn6H1IHMcl2Sn9hC2e5A
	 KXyFbGlMxvGu4bA2dVetAXST8/ntfTxyAjsd1PkIq5lrwlhuswu1iuDm7qMhPX+LMpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=emnnzxhh;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A5D606A32A
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A5D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=emnnzxhh
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so4310225e9.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795170591; x=1795775391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=emnnzxhhSXC7pOKVR4XJxY37JOLjOZChOAK8ys6839gghkzDP+P+c5pUqMAdfQBI8u
         AEHGxP6PrOmX6taHKNBIJJC5V/mEyzoX0UK2Ne9gWuY3HPn53Zb/5ETmtXitq0LlHZA6
         PLcBn6cQcLYaOEiRvWhqaGoNM/bMkhIPn/xxaF+NV2e++aJJiQ/yqseiqE3UmEx3eK1+
         ij775jpfZ1RUph0D6QJHxszrkgPkYhm4N+7mWb2I3KzT6yBo9OKyQVgSglqI1Q93UQ3B
         LA0EMG/ZrARNzVVucMAgbJCyu4tY5crfyGbBhh0vFBEgPBa/v+rKxcsxsaJAIj7/cE8w
         cBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170591; x=1795775391;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=VqGV/uvj0+2GuLiiXgc70r1aTIRiSYK+JLsvBurhWR5yRC/bez52iTyU0+LEVR5rc2
         hGeVepBCEfxH7kydYS4zIkMt7O73Jyk43cbyUy3qvNlgOLXKOOZ/SiHEfCG4gBBZcwhE
         PG3hjmvKJwywWriUKajxxNSmiBDsM1vplYao7LkiWXmJ2JwabvSjvGI8cM6D9cvWGKxd
         POJGn7Z9BBfNIduSDvgjnXQj9LEH0lp6S9CQn5WyPtF36MOiye7a1narIguPaOBglMDG
         OnRZKBR/ol83029lIKCj9ckej1QEQs86diV88vsF254mXHqgtkJPkCBU6pcd27+5y6oF
         BlRg==
X-Forwarded-Encrypted: i=1; AL+hErH51wU52vB/4QcLdPr1QUxEuyRQ/lSeoJPz09PDo4OhTZNH2e0CNYZrPw92DGtoij826kbObFNMX5bC@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bu2W2VHuzJezhPqtcAj/D8eDwxer6CTQ4ElbVh5Jx21DD0maN
	la7pmD1yRFZXsPWIl0pGS6JlgDS1tth6Hbm/dAaziWQZjOhOH9pTCNa6cc9y088/WBY=
X-Gm-Gg: AYBFou0vSnCDnsMy4Wq1CnOUidybHk2kSacUTsEFIBGi1ALlN9If9wEid7DKVmhFBxA
	ezFWSUa66L7a4BtYmAa7A/uzvC4A2T/8WhihRQ+t1RdND+I1/tM1eathg/deiH2enlgrIWHSwVe
	J6jHxrJ8F/gQeycogNoU12f6FkQ/1+UmYgURvLk6zdBtEdTGnl036i5mZKkSFsCxy+QW+Tp1ZTR
	rxxCpMfaRdXw35++grDShIK6f0jXcYN89X6OigmgZUgeL8l1sZRzseeIHEFaZESrSB+XKXuJ/8h
	d0UgKez1Z+g61CRUwbHEgWAYPdpeFI7KfRs4xwQc97WRBIQkg78Vz/YHp4hlMybgVv5Woo6oFrx
	Uhz5wDUPFpKq35qxEu0IYkopKD2GUuFlD4K6+917lDFWhtJllFoA0GMRzeuZQzyW452CWvpcF+6
	1kFQn6OlgvOF5WrXuZqA7a7iYP+XnKuqVPu0PzoNEr86w9PahV47Ov96n7xHPe2LAm9Xn2z/lOZ
	doK0euEyblVA7K6b4eb3f9F6handbra5B4cR1IAfUTWO04TyrZyrpvzp78aEYXAjBgR/jY0wKWr
	TwKCMdnjXuBLFf3+xU0r2gbGuB95BBlMmaqd3O5oW47Fn612WTUOGpk6Ww==
X-Received: by 2002:a05:600c:64c8:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb8881e767mr51613175e9.32.1795170591115;
        Fri, 20 Nov 2026 02:29:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm65912515e9.10.2026.11.20.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:29:50 -0800 (PST)
Message-ID: <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
Date: Fri, 20 Nov 2026 11:29:49 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <20261119234759.GB2324725@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Laurent,

Thanks for your feedback !

On 11/20/26 12:47 AM, Laurent Pinchart wrote:
> As far as I understand, the assumption impacts the mdlc and cpg drivers
> only, not their DT bindings. If (or rather, let's face it, when) a
> firmware revision later breaks the assumption, we will be able to handle
> it in those drivers without affecting DT.
> 
> I don't like this remapping driver much, in the sense that I wish it
> wouldn't be needed, but it seems to me to be the best possible
> compromise given the instability introduced by SCMI.

I don't think SCMI itself introduce instability.
It only defines the protocol, and each firmware choose its ids.
Could you tell me what you mean by instability?

For development firmware, Geert's cover leaves it to vendor trees:

> This list deliberately ignores ID instability and the need for SCMI
> quirks during development of the SCMI firmware.  While upstream Linux
> must only support sufficiently mature firmware versions, vendor trees
> (e.g. renesas-lts) may still want to support development firmware
> versions.

For a resource that hangs the platform when Linux uses it, the SCMI server should deny Linux access to it.
Until the firmware is fixed, a quirk can cover it.

Best regards,
Clément
