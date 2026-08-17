Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07836442FA1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979754; cv=none; b=RxMFlywV5aCc2oRoj9z2n+4jMLyWUe1E9W20dI9N3wP6bNXefdjgUusBxaGzgCEy8EqtqzMad+fwF/4PYh9UpXliz0NI7Me9sdTdTTpNkh0GteJEzSOkQfaiIZ7Bc9ZV2KITR8BYO/LDDFi5xzONzLLujOCOYk48C7UWkgG/kDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979754; c=relaxed/simple;
	bh=/9zL4j7bvEzNHZe+2GnRD64ks0ouO6ge/iHUhPBHSpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O17LmfllVPPv4LQfrd4kwONXYZ35jfw2xlxUJzUvbH/7MQMwa1DcTl8fcSaIkfdqHMNu9OU9xZZbxnLpVbQA9Cbb8htQWZ3q2RdyMMq03jKBXIFADAZJ6pVsprnFI46GGOM33ih2O3haWPE3RroE7Gx1kNekVzNDebzWdQKkw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=nURkaZkS; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="nURkaZkS"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5b048375so179215685a.1
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786979752; x=1787584552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LkIXCvEaOBZrdi7ChK3r5JFweXwKUKZFGDYp1HFtFrY=;
        b=nURkaZkSS1bFk0F9xKIrydT+A4Tbczk/jA4xGpqFU4pBJoP+aZ/Skuc1oMLRGSGl9r
         WO0OCIEPs5emafGVagWsIGAbiNCLo2cD1/eMeFIfqB8+t4q/zD/TDCoqsli6ywNXD7jk
         Y52TD7Gj5oOWKx70Rb/gd3KPYsGMVa5CvRyBZCrCOes71OqXN30YMfzRB/abf0M6fp0o
         RHAAh9MmrqRaY6+gNTqPp2RwexWzHoe5pzaLKR10S7s4rMlr+OwlMWDIEQTYtyNMIH5p
         WdjfJ4csOa+UWGleBQRIlc/r+l79t4gZDgnlScbxETCUATW9YHfV9bP5SHTRagD8YyFG
         m3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786979752; x=1787584552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LkIXCvEaOBZrdi7ChK3r5JFweXwKUKZFGDYp1HFtFrY=;
        b=r+POXcBnzArJuhjQfKfQyIY9ojVGzn0VvIiNiywXy4CQf5SiqbFnXlhnaquyS5SyPg
         WPku6ZhUf8pBUXZbpqiHtEmawM3plj/hHMspieKzDb2hmcfrsh3zGQN8tHTvEoFbbJwI
         oMAIjv1lxndN/nw4TdWfqaq3Q32TKjiPJnZCTw1/ihxt2ZY3Pcb6tIAF7HZbDC4tTUIW
         XSbsUYKu6ZzV3C2fiyCJlPfNfdIM6uqsTSdTiBAzLM2ZkL4zW9ss+mGhMCinZ5xdIAQz
         F79nUIGyFQgeYU1Ktv91xCWs+z3W6G1NWrJ+Paql2u3c7Mye9yxQ8bjjXFDC8kkKTlLL
         U7ww==
X-Forwarded-Encrypted: i=1; AHgh+Ro+dtWhCmvEqt18yDOFKKC7eJ9NPd/Lsc3Fs2KnEeBfvKsWUVfI01Udg2iVKDv9GofUDcdSuqFHyAjR@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrv1H8EycgyOmdO+5AplxzM9MtJDMsyedDLnjor+F5V6fHc2VX
	r8qxc5YpMRxF1aw19mt+RnmfpP1FEVEhpeFXkjvK9QvXt8qkXCeDF3oPEvk6pj9KuT0=
X-Gm-Gg: AR+sD11tehBAwHI1zcKtYVPNPCQDddHzIlYjGdlozzH9m1tgUXCD1aOkLkc6/E4IKor
	MK1wm/76kwQ0G9eDsuYM+zD+MfXOanz97YxbPA1u3C8SAflFMC4cT7zx7huU4FwCnd4qE8Qhkcm
	UM9ftGmCgA/4WEToUiZEvgTgvDZSzYpsI+g+pH1O7pzpLQHv6nUnDcrUs449PUY0cYAARfRMQvb
	SMCKTUSXBhJUg4dH8iwpgWh5oaRbpgT2bJKzDdHLv/+JYibJ9i1LjtfhCLJ6s81FbxkCVfa6WUt
	CrtSwdPgiE62qhj6m+/8mcQYDtJcmU3ykfYzxFIicgsfP1F40pgSzwp5//d7v3CpbH09Puo6F1s
	duNN9Hq68O1L6vOUp4DI/PJJZ5vBOhzFuBbISGKlW8RS5/JtAyk63Rhg6C6ySIn8Ff3wn7LE89j
	6gqZ8TKCENu7N9BkXpeTBnboS8mXM9/uUmXHaHYIx4EIK0BKyyxqJWFpHd6hT3Mb/tHlgetQx+K
	TwrnpYjwLQ14UwVPS/7uSx+PSNGgCesFoA00RDLPbVW
X-Received: by 2002:a05:620a:f06:b0:92e:7d53:8e8d with SMTP id af79cd13be357-93704b7d4dfmr142017785a.27.1786979751821;
        Mon, 17 Aug 2026 08:15:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937033d2ccdsm67050085a.30.2026.08.17.08.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 08:15:51 -0700 (PDT)
Date: Mon, 17 Aug 2026 11:15:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Rob Herring <robh@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Saravana Kannan <saravanak@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Baoquan He <baoquan.he@linux.dev>, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kexec@lists.infradead.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH 0/4] kho: rename "scratch" to "bootmem"
Message-ID: <aoMlXHFTvcpwOv8W@gourry-fedora-PF4VCD3F>
References: <20260811162642.3504565-1-pratyush@kernel.org>
 <aoMdJ7hpr1GonLz8@gourry-fedora-PF4VCD3F>
 <20260817145231.GA579285-robh@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817145231.GA579285-robh@kernel.org>

On Mon, Aug 17, 2026 at 09:52:31AM -0500, Rob Herring wrote:
> On Mon, Aug 17, 2026 at 10:42:00AM -0400, Gregory Price wrote:
> > 
> > Is there a non-verbiage reason to justify these changes?  Living with
> > "scratch" seems better than potentially breaking folks.
> 
> I don't think these are the first breaking changes. And if the changes 
> are fine, then that means more breaking changes are fine, too. So why is 
> this upstream at all until the design is settled?
> 

Surely we should not break deployments for the sake of renaming
something that is very arguably already aptly named?

~Gregory
