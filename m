Received: from daily.he.net (daily.he.net [66.160.146.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8955B1C695
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 00:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.160.146.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777337546; cv=none; b=H5N8Kmb9ffda+c5WN9XO7L9F27om8xbdvgdCstDO5tEuiu6XIu4T3KnUqh5GR/OTAuaMX54QKKuvW+kkjVlumw/NangpMkC8gks55cmA6kFuIl1kuXanW5mVoxt/SzYHNYR3P5yvLCy+OVDs4VFRkHvOVdTFIewsGGnLMriRi6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777337546; c=relaxed/simple;
	bh=d7wmuOhdfUF0NowX49TemEsqeFVXPiUXq/JQgCBw13s=;
	h=Message-Id:Date:To:From:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=QS6llM5qV4PA5mAm0FP6bN/BNn4cEmXJS0ueVAPGHetEXhKivt9WctlMSUEavD5842C05NjkUKZnh1RnJfzlxOOMLG6bjjjITPriVUXSJtooT63WAvuyU7fqIDs2CvaD+KWenZ7RCpS5p3ubUWy3R58NuA0FDUbtPCP1220Kf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=permerror (bad message/signature format); arc=none smtp.client-ip=66.160.146.34
Authentication-Results:smtp.subspace.kernel.org; dkim=permerror (bad message/signature format)
Message-Id: <A0d9nsAKMKinudaxj02@fred.tips>
Date: Mon, 27 Apr 2026 17:42:12 -0700
To: devicetree@vger.kernel.org
From: Mailbot for fred.tips <>
In-Reply-To: <DdX6y4BMJwqBcLAst8AQdn7dIp7BlYpideXkjX3hT2Y@fred.tips>
Subject: DSN: failed (ELS - I promised.)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
    boundary="67"


--67


This is a Delivery Status Notification (DSN).

I was unable to deliver your message to
fred34@gmail.com.

I said 
  (end of message)

And they gave me the error;
  550-5.7.26 Your email has been blocked because the sender is unauthenticated.
  550-5.7.26 Gmail requires all senders to authenticate with either SPF or DKIM.
  550-5.7.26 
  550-5.7.26  Authentication results:
  550-5.7.26  DKIM = did not pass
  550-5.7.26  SPF [vger.kernel.org] with ip: [2001:470:1:191::d8da:d572] = did not
  550-5.7.26 pass
  550-5.7.26 
  550-5.7.26  For instructions on setting up authentication, go to
  550 5.7.26  https://support.google.com/mail/answer/81126#authentication 5a478bee46e88-2ed09f99823si2708379eec.2 - gsmtp

 

--67
Content-Type: message/delivery-status

Reporting-MTA: dns; fred.tips
Final-Recipient: RFC822; fred34@gmail.com
Action: failed
Status: 5.0.0

--67
content-type: message/rfc822

Received: from daily.he.net (localhost [127.0.0.1])
	by fred.tips
	for <fred34@gmail.com>; Mon, 27 Apr 2026 17:42:10 -0700
To: fred34@gmail.com
Subject: ELS - I promised.
Date: Tue, 28 Apr 2026 00:42:10 +0000
From: FANCYDED <devicetree@vger.kernel.org>
Message-ID: <DdX6y4BMJwqBcLAst8AQdn7dIp7BlYpideXkjX3hT2Y@fred.tips>
X-Mailer: PHPMailer 6.9.3 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: FANCYDED <devicetree@vger.kernel.org>
Subject: I promised.

Message Body:
Hi, this is Jenny. I am sending you my intimate photos as I promised. https://tinyurl.com/y9x4p5he#mGsAgK

--
This e-mail was sent from a contact form on Fred&#039;s Blog (http://fred.tips)


--67--
