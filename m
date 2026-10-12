Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D42F4E5324
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836105; cv=pass; b=IvfQn/wH+NkEe03hgpNZN68iQeIO9ffrqt1aL2C2UTyeeT3fxLbtu/+tTkqIVPcqcoec2PzgzWcOkF1dTuiUHTPBnCPgV/5GFQJGIs+HQ6YCXd7zBOJ1dSJVd8L7Jjc85qX5Flb4mkIfn7Rx7BtIAFADBQfB7JzbcmJzWkVdUgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836105; c=relaxed/simple;
	bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cJxGoX7IupH1VtCkPvJfMn5aWHUPLnxqVX+MfGohzX3L1fkie5zKrZ/ov/BegM2A2/0SxKctprhhnWV2KBcgQFPIgAaYfnDxKo+d0Fkr8LkT+4WrK+CyrY50kEh7T5+nUNa/rZtYXCeFsvLVSlck4Dwr/MbwpM56eeUDw4KRt/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkVfUGNQ; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkVfUGNQ"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c2e36c7fc5dso120805566b.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791836102; cv=none;
        d=google.com; s=arc-20260327;
        b=CCy6GTYy9oVJjjMyiTUaWfLLtvkdmPmW3mplRsmVG15cOt5mjdK0sFxhwvoFntp1CY
         rNaOGi6VCqubxG6+30HjOJcodegdK+PpBbQhfBgU/trr5ZLgcqCJ/YmeGROEYYXvumnv
         RYPJgyf96UskKuHWF9GpkwW1T3hQ92+c/q6kJzT3i2Xx3BKKnd0e6zfcYnGP08sjBpgQ
         slnU5rdRzmq9nKimEPAY0p565v8Jt+GYvo59D9lcMwiAGyq8AEJHmb+xnifbW08Jwqm/
         tLtOJT+k28r/xDjCfQHHJ6Wnmly8Y5kOrl4m/hLkCulvGYzoHKpccQ+uz1NWiAHGQ7n8
         mABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        fh=oT8hsKCkyyqwwaBQ/P3eq2TnbrUwfLcLzmf8oeUG9fo=;
        b=D7JRcRQU1VNTRkOGK2mHAq5eD8t6E57VU4yVeVeXRjQssisSJ0HhWzy2KGUXy38exY
         OdbPDZ1an751ZdznmhGoSz5SWmNgEkRrQtU5FqzV5dgJS2e/LDWRa2MvluUks1HzlE+P
         e2AmaKyFllskRMG/BA0oLCEXDJv/S6CSWRRadtMy3PTgiormcRq+FrVg62cVCkL0UbPR
         bspwWvbGy8MUD+riX3BKyVztFUxjWJTzAa9R5MBSyfmF4K0ipx7dsL8Dj8SYa+isOkh2
         YA5zh1uP2M4uBdFbjGScCL+b+PUn2Jt+iB3kxBjR2zyCN1w1MiQWIPj/DQECNyjZ4Q+g
         1ipA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791836101; x=1792440901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=IkVfUGNQ1yNmn4gzvmzSsvuKHPkeLnfQKjQDS9CEK4YTguVtbIWrAxO22oCHuGOHkF
         dRlwuvdLYjmLvKQU9IKinxTmWXZIqVUJYHv0Yf+5UiBjc3JjciinIvaEGXGiEYW98kbT
         M+L8nJJhrj+yY5JXvbjILluoBVknhjdJjL6qP0x+CeGaDMq8DFHsvVLLmw/RgCKGCpIs
         HTrSNC2iLRrFECAVjLPcPqKNt92+sKsaFkE04FXVE0SAO/FGZizZoF2E6CP6xAL40wI/
         xtUfkhLd04LfFQ6/mFQvtvoD2BZoOkmLj+RgInYKvVdVHHmZW3c6KZkTA3ws7YtBGyxC
         WIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836101; x=1792440901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HS3YiJJwuBFYmXT0xY3bh6dZ6ZY38Ujwfz/IeJXETc0=;
        b=PMJzbhJ4/Fk9jCsdqofliTp1MR/WFDKPJB+M7xi2y7RoLpRHOxlg0/JsWXoSaTNgFf
         spAgOK/JzQJPnBSW+m2uniCdjxB7nZOaFy78kdp08lt/LY9rBT/rE99buCCLdzaUSirK
         qAG2BwmhIv6DUABck6cHOIFytCaTuO4H8ktaD7uhR6twgGi6WTzxcXlC3wJTRUOaeQGl
         fey6uQBHsrPqp97bJV7GEPz0JhGOVYy/L4c60FD+RVdautIhxFri5MXY+r96dC6Xo97O
         tEYgBfVBjRrS+ecpkHoBtDtTslpOFcvXttcd0rYlO3TrQmsh8FIOJPAwgwHGKkOgH06O
         iKVA==
X-Forwarded-Encrypted: i=1; AKwUvBxs5FZtj2mrTAK2pkfXr/oPOY+CriVBOd7hNYcBh46Gft8rmT/TydLcA9QOtoIrhNqRpdAVExS7/ir6@vger.kernel.org
X-Gm-Message-State: AFq9FYLZXVqVczARcvK2GENAm5F1zawR7+TvxujqocseRMl4Qs/8TEGO
	X53jQxlgAWYO35+7niLovZH9Z9POo7nMJ9hm/0RADQs5BampS5X97f/tb8fLsP3jjl6R/+5wdzP
	XlYuzlmBVnYEsGlUkRebI9HB2e1jQX20=
X-Gm-Gg: AYBFou1GvKZUfs1cYNNjiLa4MosMmhP6V2cgSl2h6Mvvd+vxmOlNi92J8EWy2Rl7cIM
	8KGfQqniGMveHFay406H3jvvxnj3vZSMq4WFaEKC2Lm8HPF4iouQYGAb86tCNxd9+yAvnv9i64T
	rC1yXL8elWI9z9VHjUWCONFG62qDL3pubOLEjNqwfU/wy5KJoHchKDpEE+IHskMQUtgL6ZSMzEi
	oSj4tly6SULq/vn9pzFPBN33lXtmaEqw484LIWIvf63L+OPBE3RIaF2LTFebeYk7eTqqGaxCaa+
	wab9s4Gus5TIfy6IrkWbMuLKHuGy/W7ZPSz7yD5G7rLm8UHVj2mleLyySEY=
X-Received: by 2002:a17:907:9712:b0:c2e:808a:f781 with SMTP id
 a640c23a62f3a-c31a9f8bc7cmr977286166b.34.1791836101394; Mon, 12 Oct 2026
 13:15:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006162807.2843858-1-coiaprant@gmail.com> <20261006162807.2843858-3-coiaprant@gmail.com>
 <ac2a4e80-6d35-457a-bdc5-ee8511198bec@rock-chips.com> <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
In-Reply-To: <CALj3r0gQ_U2ZUJkRgF4NdB1Gd3A8ZT3T6qjLhwGZPg=VUXLsrQ@mail.gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 04:14:52 +0800
X-Gm-Features: AclHuK9DIbMdxghdp8dVnDg3M3UkCfAC1pjnUxZw0sP50Y9CDUKz7Qi3PzTsHZE
Message-ID: <CALj3r0hSyVpn4Upbun4DOk5hdOH+fzEFG2E3LpfvS2YUXH8twA@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
To: Vinod Koul <vkoul@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vinod,

Gentle ping on this series. It was sent on Oct 6 and carries Conor's
Acked-by on the binding.

Is there anything you'd like changed, or is it just queued?

Thanks,
Coia
