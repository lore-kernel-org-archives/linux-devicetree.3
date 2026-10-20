Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514187;
	b=pqFDDjfKxfNbHS2uFTw9g3RfjzVW+n6vBUTqEQKM5SLliDBfFcxTXT3rl04Jf5A5vCrN
	 IUAanDkf8KXvLK9cjH2c4JnZjdhe3RKr9kndYl9WtuYrYgVgCDpEaDOtL4+7OTiEAQVol
	 3NM0NYw8yddheP8ESa98OmbyHrwXf4hsXf1b3ywxHFrBtXX9ZQyZzB7wHEJk7132NKXY+
	 ZmGjCJRSkWbZ9v69riP31p8uyPVwiwEFPVMkb2S0q38YTjQj8J0El5IlFCfjon3xZM178
	 Cjc5e9IIAP3KOj8XeKN/rJ1NuIUe864kjziT4ehb1c8iYrQqui5tj8OrpTN6/6nMosg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
	b=3jDQPaayrCIei5ZYD8wv36ERy5EN0YaZ6hUvP6+nSdiVuAmfxsAxSZqgqJU/YayeTR3U
	 fXeiIOAXgGMUyXtKXU1e5ptBOQNKNqRYvCckkvzfjrqNeVhooxUAlKH88fBs7Ky1VqOWW
	 IYAStd5pgVvYl8HSYK+7GpaxW59KY+8DLuwiw8JAt6lKrLf33AnTDJohvFvjRjF7yxCW8
	 IfwFGhNpaaOTw+b5qwsRikypE9TgvFaOsGrED0FKJF1OFFXCm9hi7P34IeiiNMAC887+y
	 PffTBy0a6unvDtiBfWVS9F1IentTPSQqjFnm5XpDdITwdvCSgKw9w64fjNavPv3YKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=ZMs3n8Vr;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786B3606A31B
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786B3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=ZMs3n8Vr
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so844126c88.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792514187; x=1793118987; darn=vger.kernel.org;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
        b=ZMs3n8VrWmFtqtoaHH3qQay866Qtg0mZRQ9UX3T3MCm5QKO4evCfjFJJtZKwu/p8AB
         p6Lt22VjkSpRThhlCeE3MHg6jWGzLRN8AiQ8wtfmdgtm0gFNHaBc4UtwmtvWuD5FBq4G
         ERxomGOTJOeRyC06q1MrsUKDHlvyPrpGI59HB1OSLxKsr7HA4zj5UKVaJq10Y3qK4BRH
         h4lB5RhwYsQJhsx9WOc2poCLrjgrc74KMzogYYEtsv3AYGO4HPtIjLt4s2S0nI/HJ1dK
         Y1BjgVwuI2BA6ccySPIIk1MglUm4ZkSdGMcFFRDpIYNJqaFGiM95b/ucvc6cJYy77m1+
         0ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514187; x=1793118987;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
        b=IQALJbaz6O5TnY1v4d1yB28li4Ki4kgMY3ZGE3uW+lqcGBXK81ZSCMHWLvZsRNhegh
         VphekQLd2RC8LiE77G9jKEob8YYaCpYxeGF7GeFd+gya9LDV69i5k2RG1jELpD9+VIhN
         fHqIhg7BxZ9L6cPkvg+byBZ23opf+KWv+LlWeB+mi5mQC3o5vXXa+GGdT90yW1XcLNXt
         jEBfAjOm/j9f9ttlqQzoeDpe9EYTy3U50sG0OXcUvOVGbG2WSOmjoquDpNph83xr5jH1
         qDsfy6yignnt/yeKl3c3fITUPlywzBMJemnii2ndnSj9BF5nIKs3GeLVVQKkmHVNDNGf
         pA2w==
X-Forwarded-Encrypted: i=1; AKwUvBw9G7lXDXSfQznpZtFJVpUl4jc3AFYxiWPAXZJh4ptqDNtoodxo3XdNS3manoCc0m8okLmzNQ5YvgHG@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ/0eL7Cbrjhs3LF0+f/Ng33QvILBklQSCc9vK3Wf6tyGl0De1
	5zCgJMRVaCwYHzdlrXcucA6+277rS4nOz2VYEtGEIlM7Th9p2Gcpbi+3O1aaLzzpcw==
X-Gm-Gg: AYBFou0vpDpHO1KVGS6JXDCB7bE4feotf2XCTe8rPg0BMAZoKJrK3+FDO6z3qUndc/6
	943zz/X8OJj1wQFRDkohcEC0tjcuiAUUZ4hZ+YWHOXmam7shbmji0lGfzHBs8INQe16Mn5dOZE4
	XFW1vFjD6oh8vjea6/B+tMES7bGovM7WcOCRWrcnigVaA9PC0WYmr3J35asX0JuLer3v2d06cCY
	LQk0aJpTr1qRoCqb1DZTxXguiZAtCCaIlgz1oHWvrwQtKPIUfZBtppSb1/RTbybp9GBaKF6vgZW
	F/HLn5YZ0ph0BK/9WZ5s+3qKG/3NZgtglhalZPOEias4WFIo5TCu887W2J0yFVdccACRvmT7VjP
	s2n0QGtUbKtUNWNKRnEQFUShM81kxd6AcRXOEbSXmekTU1I6Q7W1boh7GdarnolJ1zhuRTI0u+B
	bapSlevNk+Gw6yKugYohoPOAyE6mDSPaBGC5YJnFuMYQjkKf1I+ERvIxXKJ/K7gScctybsim6Q
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr17230352c88.13.1792514186222;
        Tue, 20 Oct 2026 09:36:26 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30859768c88.19.2026.10.20.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:36:25 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: sashiko-bot@kernel.org
Cc: "Ayush Singh" <ayush@beagleboard.org>,  sashiko-reviews@lists.linux.dev,
  devicetree@vger.kernel.org,  robh@kernel.org,  conor+dt@kernel.org,
  ojeda@kernel.org,  gary@garyguo.net
Subject: Re: [PATCH v3 5/7] drivers: greybus: Add software SVC implementation
In-Reply-To: <sashiko-outbox-169773@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 13:07:55 +0000")
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
	<20261013-gb-uart-transport-v3-5-81d0a8a1acf7@beagleboard.org>
	<sashiko-outbox-169773@kernel.org>
Date: Tue, 20 Oct 2026 22:06:19 +0530
Message-ID: <87a4o8uy64.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> [ ... ]
>
>> +    fn send_request<P: AsBytes>(&self, hd: &hd::Device, ty: u8, payload: P) -> Result<()> {
>> +        let msg = Msg::request(self.new_operation_id()?, ty, payload);
>> +        hd.data_rcvd(protocols::GB_SVC_CPORT_ID, msg.as_bytes());
>> +        Ok(())
>> +    }
>
> [Severity: Medium]
> Is there a mechanism to prevent operation_id leaks if the core drops SVC
> requests?
>
> When gb_softsvc sends a request via hd.data_rcvd(), the greybus core might
> drop the request early (for instance, if the GFP_ATOMIC memory allocation
> fails in gb_operation_create_incoming() or gb_operation_get_active() fails
> in gb_connection_recv_request() in drivers/greybus/operation.c).
>
> If the core silently drops the message without calling
> gb_operation_request_handle() or sending a response back to the SVC,
> could the svc_operation_id IdPool leak IDs until find_unused_id() fails
> with EOVERFLOW, preventing the soft SVC from sending further requests?

Well, if this could somehow happen, that would be a bug in greybus core
and should be fixed. I will look into it, but I feel like a kernel module
should be able to trust the kernel itself.

Best Regards,
Ayush Singh

-- 
BeagleBoard.org Foundation
https://www.beagleboard.org
