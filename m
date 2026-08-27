Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C342F8EA5
	for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 20:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787862774; cv=none; b=AYxUEVqyivOp7jt6loiLvCU+k1aGxhKUiyjyaKQ+US+vNYq+7xwXMCsVujx8ekSe/YQBGONGfG28q4T7NA+iX71/En6ZCpNj5591KVgo9vZB9ajN2vr9ZxGnNp9cTY+4wacw+TxpW/mqgTcTKQPwcSXJFvKih3sIeBtYmmcIotQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787862774; c=relaxed/simple;
	bh=82O/YXc1v2WRinht8WiUbNPQnVBDveS5luAPPYcwvFQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oQod7vUbJkxKlIgiDWxkW3isygfjrhJOkvMqcEa0bIwqjNIWjRMfjIkvDOG11oF1U63nbLjw/HPPqFL67QpasXBUwACNLrsB4LGsnvtsQv1/I8nqaWmwGUK7m/O2omwI9B48c/bnXOc9Vb60h59TcXOtH9N46ttid4dE7OXTfwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=WOS42X7e; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="WOS42X7e"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-855d2bfae95so696669b3a.1
        for <devicetree@vger.kernel.org>; Thu, 27 Aug 2026 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787862771; x=1788467571; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mz/K4jXj/5XRF5Ax4Mze0yfRFKcTTEx1l4BSrYQZC+A=;
        b=WOS42X7eD4OXPohl+mswHLT9tJef6vYgN5rjYcEei3hYuMJwWiNFYyzZJrt1R2GSeK
         z/nqhX7x0JLcsoD5vHNwZ3dDj9JWg5bAUd72sIuKP/Ru2USZThTPC3upt5oXZ2+dZbMC
         TkeXOGQs/HE3iEqDe2/NRa4l7+4C02VtRJkJ7Yuw4KuRjYYp7P+YhA0d9IXb0SYfPmOd
         yWDvo+Vv375Cm+EcbIGSkHms1ZZbmkWxwam/4ONvE3XZGcfIczOIuMlkBqVQ0S2gn8SU
         nm0kfHCR81uYipCUUfoiE7ofn2FBqFiXEgG6Hrm+CKDkUSlY3z9d33xi9jVjC2LAXNrH
         a2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787862771; x=1788467571;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mz/K4jXj/5XRF5Ax4Mze0yfRFKcTTEx1l4BSrYQZC+A=;
        b=DpeaTPt8fk3GdKvrcs6C4So9GWC4vEmeZOEVYKmPOVkevINasfowFfHArmTpCTocXj
         frstSxa0Jsv5u8YpDB2bO3m2QB1tOrr7u/Zem4d+ot6TJVMrJXp/STmV1hajEj/WrWd6
         K/FbVg2jAz8MWqW/MRP1Y7Y/fo8/HoaqfUmWNbiIMo+klwFTv7OUO5zCmWnCnQhVMmkL
         E/CXWCqyeF+rH3tyygnoTU6kUF7xtXNGe4FYPAk2rEnHGdlHV+1BQM/qcUNOGzlESkSI
         Q54LJw/fnoPwRM6IGUGq74hIq5y8Atdok7KyYmdIDHhfDJZ6jUGHGg4KFs5RWisEcbHN
         eDRg==
X-Gm-Message-State: AFuF++kNLQjm1sZaZl+0oH31+qnrEERLr4+W9fdgVbdkVLS5C1qZeutB
	gORQtqC9qDxHi8/aeufRe7ZZsNq2eNiykkCpzGSlkGokpWaXtyuVCZwr4OmkbGcnamE=
X-Gm-Gg: AR+sD13YAkdMBQhc/fyP2XrM8lS2tw6px+FKZ4B+fn+sItYqCNmejA3bCtrdkdig5wj
	c7uGwyRfCbHaCC4P8ONtEA5pJhIuO+TC3pJSmjEj0zLtvDbB2/JYmN+EiKDgaLfxBvDDpmMxeUt
	fZTN9KO0F32gzj0VOXWxmCl8Dfh4uWeE3fPhT4UmoT5MqxUJCNd+sROqLjGuSXS5ZOyH5RnsUdU
	FGCkDM8fUS5YBTCCBBEtj0uWIdzDtTrojzVh7WivGOgSP9BZeFX28P0qrYekPkPaJmgOaxvMEjZ
	XMeo4YrKAdeYulZ1gO7c5A7fOuQNMb5uvUuEGmkPcMYH8rqEowoNGyP2/FJk+PRUHLUCfTFzJsm
	m6F/TVwy93NgbvnTlgEemmy0AZH9A/a2exuJR3ZhTauH4m9bgRgoMn/lSrVvqmUPp76iDTNJ58a
	Gbp/P8fi/XWko3mkZVnu9P5gtOtkepyAHOiSREW4nAABmfdDzwprbRJtk4cyo8
X-Received: by 2002:a05:6a20:7343:b0:3bf:9bd9:cf60 with SMTP id adf61e73a8af0-3d0f4ec12f9mr11171456637.6.1787862770590;
        Thu, 27 Aug 2026 13:32:50 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm34724983eec.6.2026.08.27.13.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 13:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 13:32:49 -0700
Message-Id: <DL00GHMO5NLQ.KX1IN5A9UFPG@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>
Subject: Re: [PATCH v6 04/10] of/overlay: look up absolute target-paths
 absolutely
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: <sashiko-reviews@lists.linux.dev>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260805-nh-of-alias-overlay-v6-0-74f21d440819@nexthop.ai>
 <20260805-nh-of-alias-overlay-v6-4-74f21d440819@nexthop.ai>
 <20260805204009.CF3891F000E9@smtp.kernel.org>
In-Reply-To: <20260805204009.CF3891F000E9@smtp.kernel.org>

On Wed Aug 5, 2026 at 1:40 PM PDT, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Medium] Pre-existing memory leak of target and overlay device node ref=
erences occurs on the error paths of `init_overlay_changeset()`.
> --
>
> --- Patch [4]: [PATCH v6 04/10] of/overlay: look up absolute target-paths=
 absolutely ---
> commit 28d3c18ff8d649fd8af8d895999493b24c338fa1
> Author: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>
> of/overlay: look up absolute target-paths absolutely
>
> This commit updates find_target() to resolve non-empty target-path proper=
ties
> as absolute paths from the live-tree root rather than appending them to t=
he
> target base. Empty target-path values still resolve to the target base it=
self.
> The documentation for init_overlay_changeset() and of_overlay_apply() is
> updated to reflect this new behavior.
>
>> diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
>> index 08d5351746be6..74aea704835ac 100644
>> --- a/drivers/of/overlay.c
>> +++ b/drivers/of/overlay.c
>
> [ ... ]
>
>> @@ -737,7 +731,9 @@ static struct device_node *find_target(const struct =
device_node *info_node,
>>  /**
>>   * init_overlay_changeset() - initialize overlay changeset from overlay=
 tree
>>   * @ovcs:		Overlay changeset to build
>> - * @target_base:	Point to the target node to apply overlay
>> + * @target_base:	Target for fragments with an empty "target-path";
>> + *			fragments with a non-empty "target-path" resolve
>> + *			absolutely and ignore @target_base
>>   *
>>   * Initialize @ovcs.  Populate @ovcs->fragments with node information f=
rom
>>   * the top level of @overlay_root.  The relevant top level nodes are th=
e
>
> [Severity: Medium]
> This is a pre-existing issue, but does init_overlay_changeset() leak
> device node references when an error occurs during fragment processing?
>
> Looking at init_overlay_changeset(), if find_target() fails (or if the
> __symbols__ target is missing), it jumps to err_out without updating
> ovcs->count:
>
> 		fragment->target =3D find_target(node, target_base);
> 		if (!fragment->target) {
> 			of_node_put(fragment->overlay);
> 			ret =3D -EINVAL;
> 			of_node_put(node);
> 			goto err_out;
> 		}
>
> Because ovcs->count is only updated to the successfully processed count
> at the very end of the function, it remains 0 during the error return.
>
> When the caller subsequently runs free_overlay_changeset() to clean up th=
e
> partially initialized changeset, its cleanup loop is skipped entirely bec=
ause
> ovcs->count is 0:
>
> 	for (i =3D 0; i < ovcs->count; i++) {
> 		of_node_put(ovcs->fragments[i].target);
> 		of_node_put(ovcs->fragments[i].overlay);
> 	}
>
> Would this permanently leak the node references for any fragments that we=
re
> successfully processed before the failure occurred?

Confirmed: if find_target() fails at fragment N, the target and overlay
references of fragments 0..N-1 leak; free_overlay_changeset() never
sees them. Something like:

 err_out:
      pr_err("%s() failed, ret =3D %d\n", __func__, ret);
+     /* let free_overlay_changeset() put the fragments set up so far */
+     if (ovcs->fragments)
+             ovcs->count =3D cnt;
      return ret;

(guarded because on the kzalloc failure path cnt still holds the
counting-pass total while ovcs->fragments is NULL; everywhere else cnt
only counts fully-initialized fragments)

Rob, would you take this as one more patch in v7? The series already
touches init_overlay_changeset()/find_target() in patches 4 and 7.

Thanks,
Abdurrahman
