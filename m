Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6434756B2
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 13:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058013; cv=none; b=fLkxHujfRL7ubGu5e1wlgm/leQN8hshqEfD6xMsxMX3RpA52y18BLHK0dwYcet+rhVa6+JOCHBdSiYso4miCS+UOl+Yxgd0WdvnmAijtPGTPf4mXephWgQCbKy68KW3y04iB8QEcOpvauWZptAHyWb8a/BvCqyxyE22jcoQxHXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058013; c=relaxed/simple;
	bh=LvNfSK8pg0K/+mDojw7aH+VyzTbWSAq378RBV3TsZO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ablRS9dke9obsMA5Nq2PhedzDU8uEEGOhucFj4uTS5rW7AakeE6gZFBUvQoiNpiUkZiXjn5PGKmOrMUr3GZPDaWdILhyRYXBmWxk9wxm8+BVfSTDbD9fbAEHZ6RTxVqxooO7UOSfu2X9JQaGsoVjIYLMatt2JZTqAKigfAIgjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=t2WLE4sO; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="t2WLE4sO"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-936c02e58dfso293799785a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787058000; x=1787662800; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmgOUbj8BHDXCzIhBSspWfV30kk7RcENm70SlJA8E7U=;
        b=t2WLE4sOpoenct34gRpdtiZclR9xG30lSngO+niAHYZTDmgzsUo/WsJqcVMjLWypym
         cvbS0GxKG9XRzUTZPhVCK986KZs2poZE+oJOHrzReebYFZRwU42l7TKvDMg+64dsgEx/
         16b3JAiOIOWbmtVhDjUOpEJV80Ujr0oTA0a//OcGM04nuUuX9ckXxZD+QuJJbQGa0h9v
         d2ikHHRxatqfAtckPmvB9Jkxy5T2sjviMlLOiT/H0BcdamcHERMJonH+MiXrukYvpCbS
         N3h8ou++8cAHdaNSpmXK7r4p0lC71ImcBHoPZUvLbyYfJzNWs/OPxrArhTC6IWwAS7uw
         0+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058000; x=1787662800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmgOUbj8BHDXCzIhBSspWfV30kk7RcENm70SlJA8E7U=;
        b=By8QiIu0A9ab5iE6lhn8RLIF/BRioIpPH1I1hmU3YwSTLoYt/Bc4zEG5cO7onQcvM3
         j8159b51aW4sGkpfyiPqLKllBBiolWkWvsmCoC6r+H80be5KT20/4mcE0QkNHWXtjikT
         DwI3Aecj74v713MSrGgaC7BO+ZVDg8oxFJ5xwJ1vuimnrxh8Qik1aaRf7TLp/G4l7tOs
         rHTuUoCIglF8FjRWmpL7jJ1KETIJNNDqRbYZvuJPkZT5JNIoW1IFlD+LBZvcnpwc23/V
         +3ZAoAd5N4p2HuBhAkKhH1nxT0UVBVEQDq6YpTx7vl6DV4ivlULqVahj8/vINPCFDS5d
         VbFg==
X-Forwarded-Encrypted: i=1; AHgh+RpQJgmE3DN4Z3YVttb96m//5FjmhjFMOpxZU6h7RcDp5h9MyyocAJnDtqjQKP6MH0dUkN4Dn6+K99mw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf1Fwf+YPVO+gJUKESTahw/WYifvPwvgkEAJhr7OvdAfTlXPnT
	Ru+lbYsdoxuP+puxgbVp43C9bAwNcBaJGvRgw9KRB1Cw5MrugHejMro/Eiv0Qe8Xd9M=
X-Gm-Gg: AR+sD11+/TDe3HGjZnFTFRmtaKYsJAVvlKp2lv4+dNq4IiTOkqD57hhgwi4mxhbY4v4
	JabzRqQWtpX+0k4osDcQ/RYZZDNl2f7HI25FXzSBOlWEpEDiOzs6ejCUes647Rz+WrqGA5hwNTM
	NixFOAaeFfBVNRnEw3tiEBXt4FGtEWqEpt0opkopJeRoOCE/fOrHE3fiunq3i5RWd8UTqpXh+0O
	ayjWO/Dp4Rk3NBvwB2F01S/XIyhzC9Sz2+KI5icr6Wm4JnEv39iBqX7Vq08w+u57dZkBnzZDbBO
	TF+Y+jofnrye7RDZQ/Gyjn+Wc+e9gCwkSi2aZPqWasGitG26ZRQ2qZBm0e9AafK6MklwsJnWvYI
	6qA6quKC8HrFASo3+QGx1JrenKFXOizbJRpbe9lX6Yo8QuJAFajM8USm43JDsEUm9HR8wRnI7lN
	2poxL//4IE9pBqmC2tzZay9ew+G+8HNluv+dAK1VDgayf17a8DbtoNCSlshfSFMVhXrz9XZK8iY
	ZDg0M9yM4WLDf1bUxJc6dxl/xa8Cym84MUksAg90yVBlX/o/Urv4Sc=
X-Received: by 2002:a05:620a:22e9:b0:92e:6637:d98 with SMTP id af79cd13be357-936d2286961mr2640903285a.18.1787058000487;
        Tue, 18 Aug 2026 06:00:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93703432242sm286024285a.46.2026.08.18.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:00:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:59:58 -0400
From: Gregory Price <gourry@gourry.net>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
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
Message-ID: <aoRV7vF3v8DqGoyv@gourry-fedora-PF4VCD3F>
References: <20260811162642.3504565-1-pratyush@kernel.org>
 <aoMdJ7hpr1GonLz8@gourry-fedora-PF4VCD3F>
 <20260817145231.GA579285-robh@kernel.org>
 <2vxz4igr1yq8.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz4igr1yq8.fsf@kernel.org>

On Tue, Aug 18, 2026 at 12:58:55PM +0200, Pratyush Yadav wrote:
> On Mon, Aug 17 2026, Rob Herring wrote:
> 
> For patch 3, I am honestly surprised at how large it ended up being. But
> I am in principle opposed to the idea that we should not do any
> housekeeping because it might cause "churn". So I think if the end
> result is better then churn shouldn't stop us.
>

Not really concerned about churn itself, just that I didn't fully see
the value in moving from Scratch to NoPreserve - these things sort of
read the same to me.  The additional context you've provided is
reasonable, thank you for helping me understand better.

> 
> I renamed the commandline option because similar things have been done
> in the past for other options too.
> 
> See commit c5bfece2d612 ("nohz: Switch from "extended nohz" to "full
> nohz" based naming") for example. It renamed "nohz_extended" to
> "nohz_full" because it is "a bit opaque and vague".
>

Also not opposed to the rename, just worth the question since it will
break existing users. I know boot args don't have ABI guarantees, but
some are used more than others :].

>
> That said, I am not opposed to keeping backwards compatibility if
> someone _does_ complain.
> 

I think you've made the case well enough here, I appreciate the help in
understanding.

~Gregory
