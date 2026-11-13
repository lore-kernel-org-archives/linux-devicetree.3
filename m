Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794603762;
	b=cQSocQ8zu0XPbw2R3gH0iOw9ofSlbEFyWAn9Aqs3M1HzDJE80vHwNSYcJ5+2jUSz9qQE
	 l1gVyQ60adfMzCwi+p66bX92zj9EDs+B0wb2jZzxcbaDWKWFz4eLbxDie6IKAL1nIxz9I
	 +qlSbRmnQgjdeOBXOXi2Z1X029WYtK4jHhS0DuBD7YrlRQwu57da79+HR2TI+bllVKCLe
	 GmcNAnKvkk2O2mGq2wIZU4oDA3sKMG3uSoY7aAtO54RWjqU7j6dOwtWNd0W348+XJbmto
	 /zcAILaufxfrpUvYIUHC+ZADFOwTFDC1CNuQEmnJ33rJnX/k2A7LVjUvT5cc1SJS/wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
	b=xkdwzn8h4zXp+axO0P/lTyIPhn40VOZgDlxZnFEYUABePS7UTqWLy0bJ3RiyNs43fvyZ
	 BTUvivai2jSf1k6Fai+3PY3wqJkYwE9zRl7vo5vKaKGT0hthK6P7yJ4HAQ5uPuCc6HOSC
	 cDuntx5+ZozuAxCKnR8bvYpC1EDw6RT1C0MBBIWYPgVCgV/S39Oq4RNgPpr6O5R2mfAgQ
	 gCoVFCw75px1hWPqEt+c+vZmFEOXZS15Q4zcpjXj175exoAumzNLwY83Nkk9T8TfNcTC6
	 fjC6Nm4TSm2yU7sIisSMw7ECLIUfX9l36m8T9sOXejw3QPHvmPnDIqfAhJMy+Sin0AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD;
	arc=none smtp.remote-ip=74.125.225.65
Received: from mail-wr2-f1.google.com (mail-wr2-f1.google.com [74.125.225.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6053606A33E
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 21:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6053606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vhNWPkFD
Received: by mail-wr2-f1.google.com with SMTP id ffacd0b85a97d-48e345608cfso276292f8f.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 13:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794603760; x=1795208560; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=vhNWPkFDUTrf2CnKOWMgYdIWu2o0nTf/e4Pu1EMpPy+H20XWePJ5nudOwmGMKSlrpi
         xwuhBQVNPouq9VItlLs2XhVtJ7CE4XkjjcJ4GtkBi4O1eFX3JiW0DW1+HoQnoRIRLJiW
         dMlm7pVZR55ZO8iQmlKB50fDcuqZfHokMfUUZzY0TlI+h0gNLO1gLJV0goXZVzg3VtUN
         UYj1RXXhaxzNt5yibTMUm5pQ9xeI3uqvh09oQx7nEatKSJmSjwrEP7xhN/y3EVRWZCOj
         xiEW+tGGXSmWEtpk6kE0awccANgaaAs8Nfqf/Bz2U/Cv509PgCVebIBieyT/KMD53iYA
         GEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603760; x=1795208560;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h05DBnB5ThIctQb6Qu/5q1SOksB6xcZpyGzu29A+YaE=;
        b=bM9LnvH8TzkRK5h/tsjGo0GanxjO1f7tSN/Gg9w3bWaGHSGpfFlxoYpTtDtZ/vDnnX
         hsttFNIYdNq7a+4pXx5b9gu6Xgq+kt+6EnpBjm1nvxdihDTtGGoC6OarW9Qq6wy3Rj+8
         V7u4iS1QontwgHT/I2akROoxglAfHWRfECpJslif/RQom6q9cpXRwlAsX4bPsKMxHLFW
         k0UT/VotVPDuhQBfSA4NR9ykrT1n8IgXf8RpeFosdIpom9WEEmQokyP5wXJAHOpT5NPe
         QlB89lDxSnuU9rwHujw2qr0eUqN+Q5HUpxxzPfzeB3t1Z66JJtYw7O4DGfKfMNKLZ8YE
         EiBA==
X-Forwarded-Encrypted: i=1; AL+hErFvl9vprsWCqq5t/LWONCnGsRl4UpHOQQd0Pz2lVPt9aD2V+q9BmhkQ7Trvy2c78lo+/jog2o9+jl/m@vger.kernel.org
X-Gm-Message-State: APuU4Z8B+ZqFiQz1l7pjrnmftVcqRmqS4yfx9+eKoF05HBIKNztkUEP1
	xF2vfbJclDKNbrCI9+XAU/N7gr3Gq6uLNgN+VwW8CKfv+2kwhYNp6zQn
X-Gm-Gg: AYBFou3UFWRrSHTQ55ED2ILJvGQOqhyDSRLtamqT+M5fDhtkUx1xi98ozkkYrpnxUu1
	ktakbrEtsMF5vFVtJce/78obh2QV8lzUGM3XwvrHwTY72t7A2lvpiNTW2m7MRFKn23w+kjdPWND
	jQz3cjVmg52sx859jNkL1gXuLG6/lKQ4q8l8e9RupkLSDFA6P8gqFqm5pwa8pzFSMGYBjmZ8ZH2
	9x7dT1duk19dQLIUataAfx7XPzndo45aL6uVGUQ7OrN1qUUaT+aLaAT7OWjVOzNsj//F0nIl8uU
	IulCvaRjX3ewYCJrvDyyoldynR5JuFv30DUIWS963JjFz7eRY5Ik8aFDe+hT6FTEaHwYciR2v2C
	RXkLNI3eJGUMh71vi/QzTOMSiGIy8yu0oYXLqP7qZ7y6cxUzzRoQLqhUM/bKsZwuyOpaEc6vjyJ
	v5PPlgcBDcnkREEggUw3W3qHdhT136OzKoTgEJa9Rpm/wvQwWH6yVdme/t4uyFbGEncKR78Quhu
	0ImWZx/w59KKScvWJZQe7Y4VZASX0Zkwn8SfZd0zh01hxQvkaZWjUm6QLp0Pj1cLwtAXpaOsQ==
X-Received: by 2002:a05:600c:a318:b0:4bb:5f4a:db62 with SMTP id 5b1f17b1804b1-4bb5f4adc6dmr22065715e9.14.1794603760103;
        Fri, 13 Nov 2026 13:02:40 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm4635295e9.15.2026.11.13.13.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Date: Fri, 13 Nov 2026 13:02:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v3 1/4] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <1ce6d7664e48413d9a5a8b11a986f746@gmail.com>
In-Reply-To: <0a29235e23b24698adc59fd117e0a222@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKHB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
