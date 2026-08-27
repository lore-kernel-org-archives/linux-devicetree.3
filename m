Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63A41D21A
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 17:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850779; cv=none; b=Vt9laMrO/Etx5YIs7VhsonTiaUYW4bs4ofKWB+HqqQqZffBrnoDaqIYY/wY2FJzNcgz0dgx7vxE0VhY4sSBX1ZV/uKYZLO7DzScZiinP7cM6SmxX+CRQaBchWy0T5enBn7B01VXRWQBYFBn1CrPf9haRiJ5DPf3wl7uNo3wMCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850779; c=relaxed/simple;
	bh=G05FvWZ3ROG79TGw2T2POGYVVd9pzh+yGgHjP3yfwrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mv+rge3wKb/reQMNDlzRnu2S83kRzQEdKn+QI55yDn8fFdF/fdkA7MkKnPNn8Gn4riFKAiGcxRlTSy0SzXfeFFYooYHfnzFjt4Lyrnn00NHyJVaArk2P7tzRtNEfA+GSs2/p1wkAwKJWERPPxZR7ca1//vjPYtR7G/nH+nq1c1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=d8kjHvLI; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="d8kjHvLI"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so604731fa.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 10:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1787850773; x=1788455573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G05FvWZ3ROG79TGw2T2POGYVVd9pzh+yGgHjP3yfwrY=;
        b=d8kjHvLI2KlB16hQnNc8jmPycUPw0Jvs4sFNtxiCtp4fnRvNJlZK68xhLGocVJqDkC
         u2gfv93duOM+0d6lYP+ID4c3CzXVUXGHFf22dlCUAomy5f+kdGY8RC9hhN+AuzInw+Uv
         Yj3i2pDHVv8W3Zm9WMzzZoeU680WM76SaacajWw2fpszXddtfOZunQhsq7f5v/Gwz9HV
         CIliovyz2ZJjEZsm0/mRM1MHOrBQM5Khc9x0mVZZ28qdWylY7G4R1jMrOTRxQvBFwcXr
         wtENCFpjBPX+QfNAU350zl8wCc32TPbPXF51W+p2LZaTms+VuPmi+LhN4ZQRt2sactnA
         UluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850773; x=1788455573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G05FvWZ3ROG79TGw2T2POGYVVd9pzh+yGgHjP3yfwrY=;
        b=omYB5YKUPp1syK9EKmm/b9l2uWoWvuqt+PTusX9zOPIlffM1KTeKZ37IzaEKX40hCS
         a0luoXdWeuk03JT1OKHPjxUoJnGjPP1fjJ5cG0eQ6VYUk5GaGJEhpGFobkbpcoMpVhE1
         RqrVUjAcQu3am69k1PTz2Ek2Tduk4NjeNEQLw8a5cB+9+G2cRH3BJg94Oj0OGJ0PUgAV
         16Rcn68QvOhARa0/eWKEMINmYHR+jJIwXHwXV45BFT7jYquMIJmrEsXLmDbfjwNMkqZ8
         arhax3K7S4TR9LoRpcS1iR/wV5jjE9+cAyWoGZNQoUYND9B9xaphr6EMRi0yR24ZKvb7
         KVJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqjQAI6Rl0XukUcWlTbQYX49a7Ou5LmGO4oDbO3f8XmrAfdyRjm0QBvbOV+oAfRmWGY/WDrqv453SeI@vger.kernel.org
X-Gm-Message-State: AFuF++nxlqs1eKPYxa0/EpXUOIXL6Tl8lhxN5OzJH2FOeL/GtJNUzeQ5
	1PGabsm/QAwUKbumAr2Kx73CCUu8d6fylYz9rP8jBYaQa5U7jS/cE611aG75YFTvsAM=
X-Gm-Gg: AR+sD10LkHmYEPbfogfCNvIwCEs3E/dz4EgphxYanThG4V7n9K8rN80zNRbaf9hxVhm
	41ZZ44yEHf+HLZXON8RAxLWZTWcMjHDoW57Zij+JM46QqFUD1InNa2djU7E0q9qUmHDLaNq/UmR
	grfefw+wIscXxdZvKA/V6S1YGKXBvPe0kQIIt0XftmyvTRHfwjz72j7P6Ofy1J1fY7qhYgZhefo
	NmLbXz+bk/BHfcVVzb3JTs3c/1poAxFl+WPY0+4cBWGCxNo4PSIScZo4vdYvtjVlHLeWbNpvg0C
	RgBDji0G2tH8mY8+9mvRtH3Ty/toBa1tBZF73LT86lA5hK2FdZbnb7099FceUL9Byaa4AgVEjm/
	+t8ktsBZh2XX8I4LwQfIV7yseUXd78bZpGG8rPH7Fy8jum7wBv01TVoafuYBfEQ+mNDt8VnM6+t
	bz8+HDPxdNNIIx8p/OAEEEQz1wDCm7LzMnFFRvnWvMXSUYUdEnL7kEywEq4BCP1FzFUCWbEPm6r
	nqb6odHlw==
X-Received: by 2002:a05:651c:30ca:b0:3a1:5172:c287 with SMTP id 38308e7fff4ca-3a1fd4a1fb5mr44250431fa.5.1787850772908;
        Thu, 27 Aug 2026 10:12:52 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a26be2acfesm6108311fa.21.2026.08.27.10.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:12:52 -0700 (PDT)
Date: Thu, 27 Aug 2026 19:12:48 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ali Rouhi <arouhi@sitime.com>
Cc: "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>, 
	"ivecera@redhat.com" <ivecera@redhat.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"arkadiusz.kubalewski@intel.com" <arkadiusz.kubalewski@intel.com>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"cjubran@nvidia.com" <cjubran@nvidia.com>, 
	"Oleg.Zadorozhnyi@devoxsoftware.com" <Oleg.Zadorozhnyi@devoxsoftware.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v7 3/3] dpll: add SiTime SiT9531x DPLL clock
 driver
Message-ID: <apBv_Kik3Mak3GzL@FV6GYCPJ69>
References: <20260815221919.64226-1-arouhi@sitime.com>
 <20260815221919.64226-4-arouhi@sitime.com>
 <6a529684-bd6a-4187-9ed9-bb40f4b98065@linux.dev>
 <ao1Zh0uHO0mWj-2t@FV6GYCPJ69>
 <20260825215523.84195-1-arouhi@sitime.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825215523.84195-1-arouhi@sitime.com>

Tue, Aug 25, 2026 at 11:55:24PM +0200, arouhi@sitime.com wrote:
>On 25/08/2026 11:00, Jiri Pirko wrote:
>> It's a new driver. Linear review in one hunk. I think it is better that
>> way as you see the whole thing right away.
>
>Jiri, Vadim, Ivan - the reviews point in opposite directions, so I would
>rather ask than guess.
>
>Vadim asked for a split. Ivan agreed with him, suggested low-level ops,
>then core ops, then features one by one, and pointed at the zl3073x git
>history as the example to follow. I agreed to that, and the plan for v8
>was 13 patches on that shape, each building and working on its own, with
>the end state identical to v7. Jiri would rather it stayed one patch.

I don't care that much.

>
>The breakdown is in my reply of 21 August, in case it did not reach your
>mailbox:
>
>https://lore.kernel.org/netdev/20260821010556.95192-1-arouhi@sitime.com/
>
>Tell me which you would rather have and I will do that. My default is to
>go ahead with the split.
>
>Thanks,
>Ali
>This email message and any attachments are for the sole use of the intended recipient and contain proprietary and/or confidential information that may be privileged or otherwise protected from disclosure. Any unauthorized review, use, disclosure, copying or distribution of the information included in this message and any attachment is prohibited and may be unlawful. If you are not an intended recipient, please contact the sender by reply email and permanently delete and destroy the original message and any attachments, and any printouts or copies of the message and attachments to the original message. Thank you.
