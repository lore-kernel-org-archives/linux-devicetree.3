Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C1E258EE9
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 23:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477433; cv=none; b=KIs7e5bQulJcp0owSLPnxf7rPs05KyM6PG51MY4L4HcUhDY/cBOZwzfimYRVn76qXcBJ7o+ASYtdEZXdLqhiNvqixzLGiqQc+c3cNH9ZOqC4EsbVdVWhzmkWJPe7d6g2CAR5XfCGmig0LYcJzdtohMsJTv1wLoLDiP01NeSUkmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477433; c=relaxed/simple;
	bh=+igPmhB4JZnhVi+AuH5ZLh5CLwIPBTL7fVZk+I2KhiE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=kyu7nCvj5zKG2Ru0vrLkcj5lEtUw0KaXjiNgs4eA0EFwppZNYfM9WcwkBX+pxn0kQUmJZTEEdA7nGsNBJf6Dhkr7YN4euMtoSKnFPh1cIkRE8l8eLLv2TWM9SOHz7WZE2mhE6/K3pIftIPD0tVubRqCI4jfnA/c0f0Y2D8pwjYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=bM/ysKsI; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="bM/ysKsI"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca80d708489so298452a12.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 16:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788477430; x=1789082230; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rluHoATEsnIMMq1IqBSZ7wntCIrn2An5Y5Re4FkkfJs=;
        b=bM/ysKsIxPcYmbAUF6dbD16F414wqF2nwTTH+myz+OXNgyAupVFJYYipMcejqyX/83
         Xq7/hO4rE+DpOScuwTk7q2BdZ8cPy+RXkIhJAwfa7HQUKNghPYsRVNc923M1XoSgf0Xh
         RfUvKtQvH8iPugG+0r8ycSIDySO+r7YxiDfmzjv0DxURaoN9GT75uctzYd5v5JSOLc/K
         vufVxQ3qLgtuZSpt5yTpYObpCkuCWTAi/SmtHUO9aG5BOwp4KkGfCC7ONaC10lFdBy5z
         mC3R2IQV7uQJ9B+Qfc09dgxpdHLNY76pWhSG8SDfAhVnTWjKtMM9Ci4fgclnu/z67mZO
         ygNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477430; x=1789082230;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rluHoATEsnIMMq1IqBSZ7wntCIrn2An5Y5Re4FkkfJs=;
        b=asyV//DtOAI5dmGR4cR3sySKXexOgDRASFDZwvAGCOizNz7aQwZhkdaYrcMZ2K1n7T
         0gSf2NuXggSO2qwjrYXRlEW8g0Xqfiu2/dkIsk1yAT9kk4NZ2XpuH+ObMpx3bUEW2Zhd
         kFxLxSQ3yM5mYfFRVJXDU9Pnf6/jUeMIJK88WDNVE6cM28fIluVrBJlD+sub2ux/pC8X
         CQHankQ0SkyE7JkqnGHrfP/UBkr8GcowLG8whb3sLHftFbk0LVCZhBqZUrFBzcpF5f/l
         PXV4a1dUtGq0lS3MvpLrKBRrqPTwVOf3/uWuvoLcqyrq/A8UHQuy6nHDwh5/fokdLdW7
         bpFw==
X-Forwarded-Encrypted: i=1; AKwUvByeqHG4j4RtMGCz0s5Nh7lGwlWmf4zEQWt8R81ghoxgtpo0zklH85ARdZ5Tun4hhNBSruUjkSYRz0Au@vger.kernel.org
X-Gm-Message-State: AFuF++lS/61t5/wzHHYFlt5TU98L/pWz6J9wTx+UaM0st2FNZHc0ljfZ
	pBI6HGsdRQklxNpzu2dOiMTGeSm846pwvRjQiowRxX8tJ+OBN5TmQSsWlKPwO1hqNAAvhFM7puv
	VTfzrnMg=
X-Gm-Gg: AYBFou3WK2MG65Hx79FacrCMk/iJgEEMvnxrVq4Fqig/9fG+Wu1ZQkqztscIii2Nufv
	OsLxTpiqqlVFYRzYOSDrRTzAM8uyf8ql43tDtqg3osqU7BnEeFr10lltlcfbyrHYCahB8B2Ci/D
	U8x4NJPPdWdrdKoZmIVa7UVWqO9U9a9/m5l7/3oTxVdJU7zGshDrpaNGGEpfv4UBRuiRL1gvCeO
	Ogu/rz9SG7X+Hn1OWJmBYv8WwsVwHzUs/kz5j50ToGDbW2TUfBCvs+nD3snb/BTEzbbnlFYoVo2
	HNIOvWhIYRIzAuWTBDDylUbpxdW2hGqMehoqt3w2XDwNv2awrm8XMNXIZY/u1FDezetoaoYbjgm
	SD6P088mPbS2ijDkRcbeDEA80MlPT6yHF5oNkXjc3bttINoF6AMSFkOTqftSeImruyDkKrGZWiM
	xh1ACJbXXV/DXEqwin0WI5p3uLa7tS0fHwu9XRpq94DsH/pj2T44K1SH2+zKCT
X-Received: by 2002:a17:90b:5587:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-39b086549ccmr10434644a91.16.1788477430194;
        Thu, 03 Sep 2026 16:17:10 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm3324819c88.4.2026.09.03.16.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 16:17:08 -0700
Message-Id: <DL62C4AUIP38.MPEORUPGMCCG@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <robh@kernel.org>, <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v7 01/10] of: hold a reference on of_aliases during
 alias path resolution
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-1-02754604805a@nexthop.ai>
 <20260901015522.D469D1F00A3D@smtp.kernel.org>
In-Reply-To: <20260901015522.D469D1F00A3D@smtp.kernel.org>

On Mon Aug 31, 2026 at 6:55 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Lockless load of the global `of_aliases` pointer followed by `of=
_node_get()` creates a Time-Of-Check to Time-Of-Use (TOCTOU) race condition=
 that can lead to a Use-After-Free.
> --
>
> commit 6d7d618928c35a7237faefa2eebe21725f461ed9
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of: hold a reference on of_aliases during alias path resolution
>    =20
> This commit updates of_find_node_opts_by_path() to hold a reference on th=
e
> of_aliases node during alias path resolution. It also adds validation for
> alias values, checking that they are non-empty, NUL-terminated absolute p=
aths.
>
>> diff --git a/drivers/of/base.c b/drivers/of/base.c
>> index 378703dbc11f3..f7aa14d90e501 100644
>> --- a/drivers/of/base.c
>> +++ b/drivers/of/base.c
> [ ... ]
>> @@ -1002,16 +1004,21 @@ struct device_node *of_find_node_opts_by_path(co=
nst char *path, const char **opt
>>  			p =3D separator;
>>  		len =3D p - path;
>> =20
>> -		/* of_aliases must not be NULL */
>> -		if (!of_aliases)
>> +		aliases =3D of_node_get(of_aliases);
>
> [Severity: High]
> Does this lockless load of the global of_aliases pointer followed by
> of_node_get() create a Time-Of-Check to Time-Of-Use (TOCTOU) race conditi=
on?
>
> If a reader thread evaluating of_aliases in of_find_node_opts_by_path() i=
s
> preempted immediately after loading the pointer into a register, but befo=
re
> executing kobject_get() inside of_node_get(), a concurrent writer thread
> could completely remove the overlay containing the aliases node.
>
> The writer thread would drop all references and immediately free the node=
.
> When the reader thread resumes, it would pass the freed pointer to
> of_node_get(), which would dereference it to increment the refcount,
> resulting in a use-after-free.
>
>> +		if (!aliases)
>>  			return NULL;

In the strictest sense that window exists, but consider what it takes:
the reader must be preempted on the single instruction between the
pointer load and the refcount increment, and stay off-CPU while an
entire overlay teardown =E2=80=94 changeset revert, notifiers, and
of_changeset_destroy(), all under of_mutex =E2=80=94 starts and finishes. A=
nd
it only opens at all when /aliases itself is dynamically deleted,
i.e. the base DT booted without /aliases and the one overlay that
created it is reverted concurrently with an alias lookup. of_aliases
always holds a reference on the node it points to, the DETACH path
clears the pointer before dropping that reference, and the changeset
pins the node from the notifier until of_changeset_destroy() =E2=80=94 so
there is no point at which a reader can load a pointer to an
already-freed node.

Closing the residual gap means serializing the reader against the
final of_node_put(). v6 did exactly that (devtree_lock around the
load + get) and Rob asked for the plain of_node_get() instead:

  https://lore.kernel.org/r/<rob-v6-reply-msgid>

The remaining options were already explored in this series' history:
keeping the DETACH reference (v3) trips __of_changeset_entry_destroy()'s
refcount check and leaks the node every apply/revert cycle, and putting
node lifetimes under RCU is a tree-wide change far beyond this series.
I'm keeping Rob's requested form.

Thanks,
Abdurrahman
