Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602023;
	b=aS4nVhP+mP7Y3dBGqrSV2uvMUT0j2m9EZ10k5KRR3FiLdpDapFf40OlEVGagMXW6lXNY
	 2F5eSibBHln9nmlsxjwt4xHzH+5Cv1L+TfjWH2rch5I51/tXvAsexIm4449Whjc7Ng49x
	 fNbxu2oj2Q+LAVEWu+WaSQktl6QMX+SsxQUbjTqhlGQ/ndAoFQLf49io69gb6snV0SaIG
	 iEjb80vm0EbZm74PwGTf8bcyUK/x3yX0c7vDsID6JR4A5A60fxtj7Zz4YCUyYY0P/fJ+o
	 kSzvOAGkvYUx9BSyQL0PqVQROu4P4BEubt51IPSzDKb76XVb6Xb6kzhd9lY5AsmYsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
	b=vsdZGj7u3eaqpESsnIbyjYj/87GrdHmpkJOBUPISufZJJ8ExKugfDo3as4T229+4HadH
	 IvuDhqJ+Rsj/Puk+7BUWKnWZyOYXk5Wh9Zeehy/bXHgS9ziStYPYWajFCNwjUBU46c6rV
	 I+BjPtYZwQiPxoMErO89P5CzdU75Y9158Ufh9X0hy/R7/35ByEs6P4Jot0b4XRIIooBDz
	 EK8nbPdImLYYL6Z3FK16Upt4ouiv5szhKCnoVFYt2a2a/35OhfkH9u4/tMa/1U3lIar7N
	 cFBDKHH4ldk1j7A/cqWkj8nxCnQnRmaw2ze3ZN42tscVEbLjScBEDbiuqeyP+JSUw0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KaTGq/QM";
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ADE606A896
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47ADE606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KaTGq/QM
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49814d35686so846355e9.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794602021; x=1795206821; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=KaTGq/QMfrG+ztyqqp3U0jtvWTe7IwQIm0sWiGKq5xEqdbcADVGHsW1K3+5l1JwC5K
         uHSztfhTvNp2vKDKp1bxlN/IMin5/WBE6tfJZk8LKSCHgdM8Ai+rVF54UIO6sInKx835
         WimUBInSnkClOn1EXHV+7yIlbF5GLHQ+e2+EEYb/DOZ+JDG0Bqj7Asy1GrNc9nQwrISX
         IZj93ZttSaYcOGwhZJEvqWteyXrl5KZV6pXCrypVtNiGxHZwjY2ANL1xGDMmxM4ddPOj
         dfBedUknCHSsgYG7EnWtvWZJc9ZD3MFaKygDW6xz6gUAvkoirnq+uCQQZmEo0KXCYbV0
         kIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794602021; x=1795206821;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Zd4UttbjYo11JO+n38BQnbl9AC/v736sfpYh3d6fEf0=;
        b=RLp6XKh/516NHb05w1ALxiz8dhS/cqtEbOv0f3vZzw7hfQ10Sl9Cd7RwbiHieS9qpz
         ZzqP3bRRy2Ik9hmUz50MZVmwHGxsKAECufIIxYdxtvpjQWJy7ArQ4inpBbCNHkRl3POc
         lkM90Bl7P0GLtaPBf9VYQl6dknxsMFqL8kbgQPiCEdsP2C/FWU9ZSqlOjVLN1+WtpYAD
         yNur/Wlw5m9Sl+FoJrIXagT7KW3UjZ/T3uGfpjePVJex+bQd26KkunmA6YN72w5MUpHs
         5/KtujOCW3bEmNN83umIpSISmIP59N2DGQuyKsCKvbp0DFDo4AZgoqF3mQ5pVqNMlUKW
         mEAw==
X-Forwarded-Encrypted: i=1; AL+hErEJKYdnNwey6/g0kBveXw/0wAEmjxVBGx41ZES+9WOCp3Pz6aJelu82bdizyYpP7kI/gKdjUT+oOxqE@vger.kernel.org
X-Gm-Message-State: APuU4Z/KOG1iNBRsEtz6Mtw/Q8F/GrYNWMd4bxkkESjR7Dd7I2NVhEwg
	wMn9kRYZa0NNSmyCHeD3Sdt2f8OfXg+s4VBHC96iBdQ3uk1j3ehksRdK
X-Gm-Gg: AYBFou25JVd7TW9cfjGwo2Z1xAB8xUEL21NVm5p8/79vlCTQAh8iqrOQFALUOZKFM8A
	/3Q9uIiPqAnqfL6afg+MTvFR5EokbRByBCrRep471cOl3RXnttdfvJ/5vhfypimeNnFHNd3jiPL
	TyA7Zmwh3kzfeRJorQJrrpUlzXXVE4GCr6bl2buM8toK9hLubBESH48AxoAhTa59EI+bTJR0lcl
	0VrT5BbtNkVSwiucdlPOX/5SwrJButrpNUjeehaL/MJkwah2yJaPu/gaqu1HVoYBAyM2aR+brKF
	ps+N4gdZHL9FhOtkeKvVi9owsDTWn82XGhREyA9JVL7VzXhaws+R10/celYIoSTqk0A5v4xHeYo
	44Nlq519C+vvdaUyESwaWhgFe8m4A5Ze0rKw4ynE1yq7kZrLc6XqtpQLCkDTPsy3aXQDRC08Hk5
	5rS4DcK/wz0aDSstDivH5mwui2LB3LhWfUObHgO8MnP8cs+XzVOQAGXoJJASXAzW8wIriUXibxg
	GB34F+RSwH756VnZlsI5axLRHBXb8wVtwbuRJdJLJN9B0yNCI7/
X-Received: by 2002:a05:600c:34d6:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb5599801dmr79325435e9.0.1794602021647;
        Fri, 13 Nov 2026 12:33:41 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5667a8aesm59897995e9.1.2026.11.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:33:40 -0800 (PST)
Date: Fri, 13 Nov 2026 12:33:40 -0800 (PST)
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
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 vkoul@kernel.org, tiwai@suse.com, perex@perex.cz, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
 abelvesa@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v2 1/3] dt-bindings: qcom: document Asus Vivobook 16 X1607QA
Message-ID: <2c4a807496c04047b6d5735e3946dd16@gmail.com>
In-Reply-To: <9032798812284dd2842cbf003c75cc0b@gmail.com>
References: <9032798812284dd2842cbf003c75cc0b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwgfCAxICsKIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKaW5kZXggMTIxY2E1NTdjZTEuLmQyMmYxYjBiNGVm
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20u
eWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFt
bApAQCAtMTMwNiw2ICsxMzA2LDcgQEAgcHJvcGVydGllczoKIAogICAgICAgLSBpdGVtczoKICAg
ICAgICAgICAtIGVudW06CisgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay0xNi14MTYwN3Fh
CiAgICAgICAgICAgICAgIC0gYXN1cyx2aXZvYm9vay1zMTUteDFwNAogICAgICAgICAgICAgICAt
IGhwLG9tbmlib29rLXgxNC1mZTEKICAgICAgICAgICAgICAgLSBsZW5vdm8sdGhpbmtib29rLTE2
Ci0tIAoyLjU1LjAK
