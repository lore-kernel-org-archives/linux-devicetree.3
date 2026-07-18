Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FA64A32
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784418408; cv=none; b=F7JKXt9jJExVNe9K3HwYb8ivZbQwrrg0UO5aZ2bFre0quFNZGqx+jO4E/bMd8jWLx5/5a/FebuMev0YWhFhv0Z3C6GKBlG/1wH/Ygo2CRxBK/GXmGTFWYk3I6m48yUCJkebVwEmsWDx9oq1OT5q0vHvEParPQC5G05jNL8xsqX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784418408; c=relaxed/simple;
	bh=OsIvBovZjcTK6vIoP9bjnaTXOZVjp09XO7gy2+wD8rs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=acyK4zPgsC5Js5qqrv5jKH8x34C3NNIZsj//DbnvoV83OasTIXz7NhD3QdDmsu0U+p1BOcCYoj+tJ9zmVEs42sufsiKO0thhEyDk/Piyv4Mk/Za4dDhxhy8wUXUvyGbn1kL/ECVf9qoGlzrIDhi/8nH25d4zici0lscGtvgNGmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZ2ndLpo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LH10/UOb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZ2ndLpo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LH10/UOb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IN387k1907878
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ITSdZDkV9Cn1Z6JQ1FPbQ/2s0KFaMPyxzL3H0Lmz/I=; b=DZ2ndLpofXSIvdFb
	PEZEv5tqLA7PUJs/JNndOi741W5gy0tSU59WDGSww01VkGtve2tpi7wuvsPuj5eI
	cgOi7Hb7Rc+UOAZ5XYMLKCNUjwyaIiUF4coYR32GOd1fBwYfMl78ZNUc18Xyw9IK
	HYMAcYPAeOZmxtaWddzSo2oc4s0H6Byvo4FNxXHTsL96evztcjhNegyxCyIjP0Sv
	07Jjp8KnGcREPKXf2J30aqsPwSZFOlbSkDbrka6KruIfVEJZlAd9+Fv1dKhGFD8y
	GvnFvP7s+4t6L5WF/DSj0u0aYhfqQ8B0eoCj//siJGO4VBVaV6xXWtpbyjSsfCdT
	CfF14g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bnhr97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 23:46:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-848474825ffso3406676b3a.0
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 16:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784418404; x=1785023204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9ITSdZDkV9Cn1Z6JQ1FPbQ/2s0KFaMPyxzL3H0Lmz/I=;
        b=LH10/UObHT7emA2NnpX3x+1By5F3SE7Jhl0RJkNqgruzEpx3K4F80p/Bq+WeBWr5Fk
         k6gw1XeNj9KneSrc32u+HGACGzulLhHeZeih4A0yTw9uVVZy//31ff6iXNEMTDpo+0Tl
         psAGLURf4MV4s2Ztq8D5iK9HUX5FTQjsTuBQqXhxZddu+UZrZI9pF/FdT8kSC8LEX+7X
         b4WlX9BolEROVG5UOkfXklpiw1Tp74x+O8LsIQD7g+3mXSwE9B9qGODSDUknPyOCy6j6
         tq9RuUfZvwa2wldl40q+mgV/DgBbr9nwfGsiKmENi1JwmoJhBTaytL5SSz3+W1E10w4P
         eLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784418404; x=1785023204;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ITSdZDkV9Cn1Z6JQ1FPbQ/2s0KFaMPyxzL3H0Lmz/I=;
        b=U68PKv1jRTmYjcyJ5MKg0JPHzk+l5BTIE2gPY77OZoIMAr0SBH8GaaQg3doG+0TGiV
         SlEWrjVVvSBWJD672tYsSEvGmqNyVMagDy+lqlxa9s8CnzyMxwuaVbKpMhyIHgFdSHuG
         5M/jyRYoDza4nXsuqGX3Xpegclki1MVjCMghHZ7n+D19ttGXeE5/489nP7dbTk4ZnpJh
         UM/Dx5zCoT9W07VIBZeOHV7WEb0X1Dqmz5H/XZFSd5qMCDriOtd9HhnEL/PNSQKl3d5n
         2Zr+zkC/OzsdH/f8xwGjWbfTHebrRbG3POh45mtsCJU68Qi8n+DCOe1Ly3D6oZldAAUF
         ID4Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr164MRmOo2tqnI1Y3gWfbL5iHTGpM95QuoGsJhGkjhcxbq5M8vf28+6Xtd4jZC2EJwxKwnBJnprf+h@vger.kernel.org
X-Gm-Message-State: AOJu0YwdemNIwFLVPzrRJRLwVH+ocGAeyoom3TrlltTIJueCmVbXw7+E
	stDYpeGgKcIMrVeDjq1HGFyyvs6Gmt344tfw+yNJYcjXFXOtR4bWZEZbsrUVOkDw6sDzgmIKdnf
	ZDbxyWj3yvo0YH/7mjNRhTQaxwZ0+/kK3k0yljshlPn518uC9npFLXdFsmgRJQY2x
X-Gm-Gg: AfdE7cnE9Z5UE8qZIeDvx9d5jqJ4kpeHI+flT44ieba77wkMd32gG6aTkqoQNAlxVAA
	Py6k9dFjzxFocYDrySWlwB3Ay6uQVnAwY6MiOfSpDv+C+xNa7dc8EaSTVkY0b8CTTp5hi2Z8kjv
	R7ogOoH1mGJqczFMU4cVUSHL8mNg8vyYEQRXLpUEedLARH8+VWdf7QeZxU5GNt1/S6MixHLKT3p
	urT/2SWXsrUhhmFh0JYY9+oIF7jI/YxhylldpKLKJygE0YPcEuK0y3rQKtlzgRtzMdEl2a/Ai6I
	cvgj65e24QCI6Et+hoL4TWakmbzuGBMMo1XBA1Tf7mFvWqOHyPRud44xsTnJm8LRK+3xwAMfr/8
	as8G/yPFBG1DxC4gT
X-Received: by 2002:a05:6a00:390a:b0:84a:6376:cf52 with SMTP id d2e1a72fcca58-84beb309d9bmr13004730b3a.28.1784418404450;
        Sat, 18 Jul 2026 16:46:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:390a:b0:84a:6376:cf52 with SMTP id d2e1a72fcca58-84beb309d9bmr13004706b3a.28.1784418404002;
        Sat, 18 Jul 2026 16:46:44 -0700 (PDT)
Received: from jic23-huawei ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af30befsm3312454b3a.38.2026.07.18.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:46:43 -0700 (PDT)
Date: Sun, 19 Jul 2026 00:46:38 +0100
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rodrigo Alencar via B4 Relay
 <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, Michael Auchter <michael.auchter@ni.com>,
        linux@analog.com, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Michael
 Hennerich <Michael.Hennerich@analog.com>,
        David Lechner
 <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook
 <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>, sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/8] iio: dac: ad5686: refactor command/data macros
Message-ID: <20260719004625.044c098c@jic23-huawei>
In-Reply-To: <20260716-ad5686-new-features-v8-3-ebb0051af5e5@analog.com>
References: <20260716-ad5686-new-features-v8-0-ebb0051af5e5@analog.com>
	<20260716-ad5686-new-features-v8-3-ebb0051af5e5@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: R6wFcAQ5L5m1WdFY9GlXeX4FEc4zjUAs
X-Proofpoint-ORIG-GUID: R6wFcAQ5L5m1WdFY9GlXeX4FEc4zjUAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDI1MCBTYWx0ZWRfXxdcuGY5p7e/A
 PaIK2fnkHUem6haLrUA4pHhzl9UU2PiANxeX/UKrYgj/P+2RcEJmvI3imvT+DplCt/u3XeBLZAY
 jMF0fyqbn+xuz/X5aLTPGOUgFbCHOd+3L0y7euSPfQXvYh+iQdZj086Z/jwK7L2QlcfB9V+p8om
 AAmmKMwwBWj5GrCxNZKsz7kJTa+8JK0zQM386Rw5XDqxOYBYUqpX5ICo6KbrzAPANxsjcvtp/8I
 l+mLSX94igg+Hx/0+v5xm3CW+G4M5Or6wQWiiYEwU6szfNHpfAax9LOU6ED2dM3B1eslnQIJmig
 vjogEvUnUDzhl5udmMuwpII070D/pSMvozbwEk+6bkMQxibvOuVABiU9+TkuryJis/Y/SPc533U
 wMbGtpEPtdZTrCHTMdlK/sdIaaIuKFsvoEK5BTEewWNNDOTyPOTdkdFel7kcH/PRxcmsjRMuH9Y
 t7KL5Vf1a0HQIaVSA5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDI1MCBTYWx0ZWRfX2CbaVoTPuvFI
 rv5ACdKXOEM82iGFze3NoKeOm+ALuBc5qTlUscEyEt3Z1ao9q2+tStEgw+C27ys6RCWgOppBaDp
 4wxOwkJ/xUq65ZUCOtmoNpROaRXuYws=
X-Authority-Analysis: v=2.4 cv=YsQ/gYYX c=1 sm=1 tr=0 ts=6a5c1065 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8 a=x788Ep6gh8qEEuNuW64A:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_07,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180250

On Thu, 16 Jul 2026 13:14:19 +0100
Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:

> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Replace usage of bit shifting macros for FIELD_PREP(), which would not
> ignore bit masking when preparing SPI/I2C commands. This change is a code
> hardening measure to be paired with the upcoming triggered buffer support.
> For the AD5310 regmap case, 16-bit data coming from the buffer may overlap
> with command bits if the data field is unmasked.
> 
> *_REF_BIT_MSK and *_PD_MSK bit position macros are renamed (with a DATA
> prefix) so to indicate that they are relative to the DATA field.
This is a bit of an 'and' statement in here.  I guess I'll let it
go but ideal would be to have done the renames as a precursor keeping
the focus in the main patch on the FIELD_PREP() introductions.

Jonathan


