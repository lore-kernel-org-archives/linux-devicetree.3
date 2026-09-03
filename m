Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F7385516
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 23:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788477099; cv=none; b=j0GP2anAQ9mjqC76I/uurw0c0j2cA+1blUL04Fg4U1MahpL4oDLS/Q+B+1ychbhiuhLmUKvJfRaY2C/DYDGvBrTRgN2AVYMt/bSlm5GpNA2OJgcB30dPHpTNzsLcO5GMS/6yLDOPuYf2wvH3O/1OOwE9a20Tkuq5Sk1AX0qsrkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788477099; c=relaxed/simple;
	bh=EuDeJM9Gleqr3obuv78xc9tu4WIz5KvR7h3hBO9Qgl4=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:Mime-Version:
	 References:In-Reply-To; b=sMptdDapkU57PBFvVgLsoNX8hcSEluZsAVwiJPCZYu+4QoiKtiK7tHytqIioE+QBvETtHnIIWRDfHgeIOLa+3SIX9/OOOXTIeSGeR+LkluylFyW3azY77t4Fio+r7rMJLp6aFByLQpv1ocz/vinI+/05T0gKHLaXusKQBhjKFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=DgwjODSy; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="DgwjODSy"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38759bcd877so373590a91.2
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 16:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1788477097; x=1789081897; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpcDzHKvUQr8nZ3HzzAN+drcJ/2pYiQIPhzCxczuZ7E=;
        b=DgwjODSy++6fo8mQhn7ecebGTCczpIT2y/LQCNQupHSAbtEsTZfQS9iZUqFiOSlJ81
         BH4cxddirfQtLbFGHgFr0K0BEnDETlS9r4oKW5P+bO9rN7z3olANGzZ+C46/ekiYWRUX
         g6S8h8t10FBkyJEv9l37U8HMpkxsqyCC653lfXmbsPJ+hA7i8QWwca3vjeok/Ffu+KDa
         2Aj6HjSx0lYH1S6Bkf6c6MvviCDtgz9Z9pzOYRUffvaI4idr5EJlPJeORmtYB5Xa4vuk
         5ssbf5SOZPptQlRkDukvfKHTNQXdiyJdUuSEnUwQNZhipTpjBauxzk6KyEH1Hv8KhIPB
         lMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788477097; x=1789081897;
        h=in-reply-to:references:content-transfer-encoding:mime-version:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpcDzHKvUQr8nZ3HzzAN+drcJ/2pYiQIPhzCxczuZ7E=;
        b=Xbm9+jEyWGCsw8jCnCHrwVx6IY64RNPFsIDt8K6zuSsyn8ierajcQejsMU9ZxmdVOs
         i+nfVgoCbBcVkFw6phh7fENEQIdrkBtAegVsi1PNcmDZEg7wwyVEJ1sAp103fcKIns+z
         1SmKiJhAFrU3n3RtGKncXnlYGz9vzoDY5h9oX2VR24prVRLMKX4nbBJ8gVpvsLcb/iFK
         q+ExSGb19EyS5nEEWhjIdrypdXvNknlyZ1RrUaVEPEeT27RMWmfvxkUNONfBnKh3yhiA
         jy3vkd2jnDCAa+kKLTWFdQRQAuItOSBTMZqTeYY//7KjSFOpvuCeOXE/1DYOL6OwMGmN
         inxA==
X-Forwarded-Encrypted: i=1; AKwUvByufSWBxhaIz35XUdxSVwg4wsRKC5mIMXc6XlJnrAsGOYqTtTyhVVUuhJmvYqP+tV1cJ406ZdSeC5Wt@vger.kernel.org
X-Gm-Message-State: AFuF++l5bB8/tkBjNI/BLzjpWwpV9oIl4R+COyGSpqpOlcoTZ6zpJJ6F
	Q4iHSdHIE3lMwnKJv/48QUkc+9+EQnpEUz5hPrcs7g+4e8nsJlrKvlPYwGy5za/lZULtxEtiRvr
	Mdv55EyA=
X-Gm-Gg: AYBFou18QgAqFAeFSDC2cNNNerRn7Tdq6X/oF4AXGMcmHNlqUGkvV+NZUZNWGAKYAoK
	RhyJRUvLuu5F6nsaIOBvQ0NpNIsHiKJwKxkOvWRxLjXFEky1qvXt++9ahTQkxODmzOLZQU1zdQA
	sdNaGfowSRs1E6JzToD8Yl/TpM+kXDknrYxJOMsn5nE4Ieyu0mdtAp3Piz5TNrRE99RrHK9M3OE
	3anr3r/BSDJ6e3D2kDeh4NYh7XFof0vCrWaPH2Lhii75CiXDPecWSr0Kp4zCg9mlEi5kTSlQDn9
	Cp/7paKJ2swSPpBF0+hzh4OC2yoYMa3szzWTsH9VM+DMcME47C/M7U4O9AtQ4y9ZjfODIzrT4B7
	n4bnlEr4MAsKoCoBCzTcObPoyF7FUm9g1KDtcJZaA1XWC2MFBqo+0Nx01Cr9QXp5TPSRd3XEHOV
	D5pLzb24Na0/E7giJyR7mv/xIu4gx7oTDyn1s/3OTNUhUmgcgDMDDP2UX1khwk
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr2655024a91.4.1788477097408;
        Thu, 03 Sep 2026 16:11:37 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm1893309eec.22.2026.09.03.16.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 16:11:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 16:11:35 -0700
Message-Id: <DL627V92FSCZ.2Y9QLHRJJWO2@nexthop.ai>
Subject: Re: [PATCH v7 05/10] of/overlay: only treat a positive changeset id
 as registered
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260831-nh-of-alias-overlay-v7-0-02754604805a@nexthop.ai>
 <20260831-nh-of-alias-overlay-v7-5-02754604805a@nexthop.ai>
 <20260901014554.83A8D1F000E9@smtp.kernel.org>
In-Reply-To: <20260901014554.83A8D1F000E9@smtp.kernel.org>

On Mon Aug 31, 2026 at 6:45 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] In `of_overlay_remove_all()`, passing `&ovcs->id` to `of_overlay=
_remove()` causes a deterministic use-after-free and leaves freed memory in=
 the global `ovcs_list` and `ovcs_idr`.
> - [High] Lockless iteration of `ovcs_list` in `of_overlay_remove_all()` a=
llows concurrent modifications, leading to a Use-After-Free.
> --
>
> commit 5e44e19c9c02429165243b3c23378b30ba40fdd3
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of/overlay: only treat a positive changeset id as registered
>
> of_overlay_fdt_apply() stores the idr_alloc() return value in
> ovcs->id before checking it. On failure the stored id is negative,
> free_overlay_changeset()'s "if (ovcs->id)" check passes, idr_remove()
> is called with a negative id and list_del() runs on ovcs->ovcs_list,
> which is not initialized until after the id allocation. An allocation
> failure at that point dereferences NULL.
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 08d5351746be6..9b9f198a1d70a 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
> [ ... ]
>> @@ -860,7 +860,8 @@ static void free_overlay_changeset(struct overlay_ch=
angeset *ovcs)
>>  	if (ovcs->cset.entries.next)
>>  		of_changeset_destroy(&ovcs->cset);
>> =20
>> -	if (ovcs->id) {
>> +	/* a failed idr_alloc() leaves its negative error in ovcs->id */
>> +	if (ovcs->id > 0) {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this check cause a=20
> use-after-free and list corruption when called from of_overlay_remove_all=
()?
>
> In of_overlay_remove_all(), we iterate over the ovcs_list and pass the=20
> address of the internal id field:
>
> drivers/of/overlay.c:of_overlay_remove_all() {
>     list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
>         ret =3D of_overlay_remove(&ovcs->id);
> ...
> }
>
> Inside of_overlay_remove(), it zeros out this ID directly through the poi=
nter=20
> before freeing the changeset:
>
> drivers/of/overlay.c:of_overlay_remove() {
> ...
>     *ovcs_id =3D 0;
> ...
>     free_overlay_changeset(ovcs);
> ...
> }
>
> When free_overlay_changeset() executes, ovcs->id is already 0, so the=20
> if (ovcs->id > 0) condition will evaluate to false. This skips both=20
> idr_remove() and list_del(&ovcs->ovcs_list) before the memory is freed,=
=20
> leaving stale pointers in the active global list and IDR.
>

Confirmed. of_overlay_remove_all() is the one caller that passes
&ovcs->id, so the "*ovcs_id =3D 0" in of_overlay_remove() zeroes
ovcs->id itself before free_overlay_changeset() runs. The
"if (ovcs->id > 0)" guard (previously "if (ovcs->id)") then skips
idr_remove() and list_del(), and the ovcs is kfree()d while still
linked in ovcs_list and registered in ovcs_idr. The next ovcs_list or
ovcs_idr access after that walks freed memory.

Pre-existing =E2=80=94 the ordering dates to 24789c5ce5a3 ("of: overlay:
detect cases where device tree may become corrupt") =E2=80=94 and latent, s=
ince
of_overlay_remove_all() currently has no in-tree callers. Still worth
fixing for module users. The minimal fix is to stop aliasing the
changeset's own field:

      list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
-             ret =3D of_overlay_remove(&ovcs->id);
+             int id =3D ovcs->id;
+
+             ret =3D of_overlay_remove(&id);

Rob, want this as one more patch in this series (it sits right next to
patch 5), or as a separate fix?

>
> [Severity: High]
> This is also a pre-existing issue, but could the lockless iteration in=20
> of_overlay_remove_all() lead to a use-after-free?
>
> The iteration of ovcs_list in of_overlay_remove_all() allows concurrent=
=20
> modifications:
>
> drivers/of/overlay.c:of_overlay_remove_all() {
>     list_for_each_entry_safe_reverse(ovcs, ovcs_n, &ovcs_list, ovcs_list)=
 {
> ...
> }
>
> This iterates the globally shared ovcs_list without holding of_mutex. If=
=20
> another thread concurrently calls of_overlay_remove() on a different over=
lay,=20
> it will acquire of_mutex and remove or free that overlay.
>
> If the freed overlay was concurrently cached as ovcs_n (the 'next' elemen=
t in=20
> the safe iteration), the loop in of_overlay_remove_all() will dereference=
=20
> the freed memory when advancing to the next iteration.
>
>>  		idr_remove(&ovcs_idr, ovcs->id);
>>  		list_del(&ovcs->ovcs_list);
>>  		ovcs->id =3D 0;
>>  	}

Known =E2=80=94 you raised the same walk on v6, and it was deliberately lef=
t
out of this series' scope. It also can't be fixed locally: wrapping
the loop in of_mutex deadlocks against of_overlay_remove() taking
of_mutex itself, so it needs a __of_overlay_remove() split. That is
follow-up material, and equally unreachable in-tree today for the same
no-callers reason.

Thanks,
Abdurrahman
