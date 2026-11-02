Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646272;
	b=ghorYpqyE2yliuS7SMs5GKxfEmCdrCj6C5DN/VfGBmrrJhcPEj6WagmtFnNzMKQXoq4X
	 U9ubDCRQYyHTlGUOdiiE2tI3GzFW69HFwCdjUB5J9KUljhrCCjA63P28kUthkim9TRfVx
	 iZ2ex0UIsV5xjSqEQIRYQAD13AD0uKR2kQG+LzqQepw/BN/GCZ0vYD2vD9leHxh4nBRBf
	 93EVHl310Q26HAFUj76OZ4w7/TlMbIbV5rNlFrLY1gxu/owDoa5OmEdseShWM4fu2BlF7
	 P58pQmPe3v0GdP1SnDed7aZqRVbefBdWBP3Y/yPaJGlACbz5oFS57pxdZwQ57Nel+cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646272;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WNl+WIJmQfQtIhLyh0Rb+fNz/gAo+0OLhU5cxN9ggC4=;
	b=B2/HwlYEVSp+Ylt/t4aO5JsFVqYSnKAFtYZj3e1ACxQnKCxaQrGdhdoAOYvg+O2yrHht
	 qo1MjJnRvhrToEqm+T24hwgdj+K+SHDaQOkInupxf7LxGNBQquebXO+NSYbYTVH8vgbFZ
	 eM3aqkusNotddO7YHBx196WERx3pTLlMU7vXMscwCzTeRknGssWW1TPQlMSc6eBcPeYII
	 KIq7NpR/xC8YreOjOT8W5j+2VkR9NhartoExXxY+04PDl8wop4Usib0q/yYIB0d5lRAoT
	 gtrUgFKAPKBoCPVS/VsqSPSB2fslopiPi5fT2xMXCCtgcC3YqhpfTMK/htQ0A9UyIWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+9ptF8Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQnSNjzX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7BA606A332
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7BA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+9ptF8Y;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQnSNjzX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2IsrGH3128920
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 19:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WNl+WIJmQfQtIhLyh0Rb+fNz/gAo+0OLhU5cxN9ggC4=; b=E+9ptF8YEcqVD/za
	HH+mvPStaahyXqu/STEIcYDiUjt+IUlG2EISvJcwCJPBTOizvX7ugtj2RL4HraRz
	I+Eg7lxnpzMHnSrViQrsI8r9bxiQQ0Yv2MuiZ4iczL0RP1+SceovLvxbZD49DeNb
	5fUpeeg8EXuqa8b2YDi4OB0AqzzJpt2CO2rGSKxm3ZG4Vv4fMCz7PMJzzRAJDWgG
	voGqng8wW0Ij6nT4WSutwkpVYvUqv/1HXDaAeydsduaiSj8kfvt9Bs0GAY/Ydn2C
	ByZhnlqgNBUcQj+fU4rd1JpTysyZBxHpcfPzmPRUVWGHZWX4+TKq9XFlGwWqtdsk
	y5wxxg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07eg1h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 19:04:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so5179564c88.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646270; x=1794251070; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WNl+WIJmQfQtIhLyh0Rb+fNz/gAo+0OLhU5cxN9ggC4=;
        b=cQnSNjzXjACONvAcWHS7zWYqzoNktxDEgmloN2Z/4GMc5+hqlgFWeo6gF/2mRPOP/O
         CU/zE8qDWaRnMq7M6Q540zcF2gVoWK/iVJ6x3oRKOXlUqUti+8MGIiPXax5uYIqG7bOu
         uJmiYW4IeREUN44u+tCkqKvVuNoAQtFl8WeinMmOsSX8F5EYCsv6xyE5lC3GoKYc+ein
         6nQoHlGbW20isI5qisg0jmBh5CkWak1YpFdQSiuLwA9K7NGivGTRLpC3XIuDxARudjaC
         9lfTa8lcm0wRpOUSZKSfeDkX+p73o9M7dYEDYeewA95Q3XCd3Uff21rWzyk6UYCs8iET
         IxUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646270; x=1794251070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WNl+WIJmQfQtIhLyh0Rb+fNz/gAo+0OLhU5cxN9ggC4=;
        b=d3RpFB+qnJO8NVv76cxhqT/J4rCXpViByVKdcxk1aJtMU9hAkGOtMNS6gYEHbcoi+e
         gOwR2hxWdqtqHgthsqu335r2JStYV+dbB49jsl11LLon9ZpkwUqOhLH5ervpzs009IFz
         DKk736ooDEE0XTRkziCzCmyxTiNnVF8qfBTBhYI1oxKMbXb+IHAUHpeefMcxE0YtpCXz
         evLtAZAJQZVPSemz32hEcToZjcQlEAu2p9x2hLboD2EorHRDwOcQDXjoMvwlTkJOX/0w
         PPqLgng2vIkL3sp3cAQMRvohcMVkirXI639yDpRzh8O533uo9GnBsPdEyPPfY3QlKDPc
         KmmA==
X-Forwarded-Encrypted: i=1; AKwUvBx6bQI6ryGoLl6ckxamVwJOV6IpJvvcNW84FwWIN9oy19E6Bxup1OnzGjmsP71EqsEPRmDai5C+9Wtz@vger.kernel.org
X-Gm-Message-State: AFq9FYLft5J2vLtevzzANCLcGZx6yPS+/iDGl7tTy2ZNqDsyRlE3Zf4V
	lUVsdoJd3XFOk32rkpA3UVlVlBwli0aLXUmnMMTAzcbGEmjlH3xprZFdhJXu8r5Zi2hSeKKtK0s
	ECOl1kFoG6i0eBNPTi4dls1qkczd4iCTcEJ2n8LfZB8ThK2RlXln5nWIbvHumB4X9
X-Gm-Gg: AYBFou34xjFBnG5muLZUe85WH+5e1r9Ajb/Fca/Rr0Dqbpyh/AonJkwwJqU7bJKmQQf
	2WLi2bjI5kJqmSnC7CONJ8O/N6mWR6yn3Hj4WYXZS8WX6JQvJl3M55HHqy+c5vO9MjjX7X/7R4D
	D9SjMaZhA2vdqFUV/euvoIEq75F+l0THFEYhgzYalvUiLF2ID5d3Ra0XdH9hUlj+0rdOjGe18+Q
	j/p8yVBm98jT9YBCJQK0+Z6dsWKKyB2xh5yiC59GmlmRUdlmcdCLUkn2JC5+PDmaZlbB36+C7qJ
	BU4nUuefLateuTz1pM4yKJhK0yEzsP3Oituu2rJ8r/GGabYo96TYq9F9DQc2Z6P7FuO+d9Aap+f
	wiT9Q62WEU/4KADL1OgbNFBMeWGdTWW2pusCcZm/2UC9Wzy9SCLB7bFQcTie2vdk/ks2p/lDsxK
	gXvQ==
X-Received: by 2002:a05:7023:90c:b0:16e:c820:b20d with SMTP id a92af1059eb24-1ac56ca0005mr17419168c88.5.1793646269676;
        Mon, 02 Nov 2026 11:04:29 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:16e:c820:b20d with SMTP id a92af1059eb24-1ac56ca0005mr17419119c88.5.1793646268882;
        Mon, 02 Nov 2026 11:04:28 -0800 (PST)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm46797035c88.6.2026.11.02.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:04:27 -0800 (PST)
Date: Tue, 3 Nov 2026 00:34:21 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, robh@kernel.org,
        devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: qcom: rtc-glink: Add PMIC GLINK RTC driver and
 extend pmic_glink
Message-ID: <xddy7hrjpq4oy5j3rtoelnqindbf6jibibw2cmtvxrcr4sjvww@b65l67ttotu7>
References: <20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com>
 <20260807-rtc-glink-cleanup-v1-2-7801e4d69c4f@oss.qualcomm.com>
 <20260806210934.485441F000E9@smtp.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806210934.485441F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX/pOcpJLmvmf6
 gySUnmlKJ8YGCi/f1ZEhr8OoqOZUqaKLFIVU1+aGMfH/VWsBH3jo8Xg/zWR+8iPQSp/XtvtWs2q
 THEM/7Dc8ergMWH0gS7EExnZzUzooKCGzbXC/IAK4rC+rdBgaHAsNulIwnEG8bwZ/jNyDdYVKfF
 ovOhvBe+7+vrOM2FjW/fdUWaP9jNd6vbeeruWwFfE9f4Rrk2xDa5oAMt+tOw1OUlvMptzf1Ca7w
 ImCOsMNJvsA+hMaXGDsquqnsByGpO/kNw8g7pliAMdBEW3c9BjxScv1Y8cJz0d1e0g3QSGd8IjU
 QXKD80yyjuQOTmHo70ZkTd+OoPBHVz98DhkJYvvY8VGfxd5Vv46XY3pyS2YDTI0t5sDwgRUxrA0
 h6z1uxZI0Ypzg4yLXVsziOrqx9UTMzTE20XT+dbNLjpBLWCmFe6quoZDUfV5kYArpo4odzYjF9i
 fdBbjrWNalxDS/pBA0g==
X-Proofpoint-ORIG-GUID: HNIFQsFIZXdOljBu-S31GmFEFa5MhzXp
X-Proofpoint-GUID: HNIFQsFIZXdOljBu-S31GmFEFa5MhzXp
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae8debe cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JrO7qsCQhtffN_GIcuoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX3iWHW5c2UKjv
 9ySDjoz3Zf/A8iUYhRdbo2Bq4a2MLRS1GDtKWrGOqhF9+vBbaDd1+Vc++3En64o08b5A2cwwiKK
 BrpJbSHCeHeUWgl8Dbe/Ur8xTKdWlkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

On Thu, Aug 06, 2026 at 09:09:33PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Racy cancellation of alarm_work and incorrect devres teardown order causes Use-After-Free on driver unbind and probe failure.
> - [High] The callback extracts the property ID instead of the property value for GET_PROPERTY responses, returning the property ID as the time or alarm value.
> - [High] A timeout in `qcom_rtc_glink_request` leaves the request-response state machine out of sync, allowing late firmware responses to hijack subsequent requests.
> - [High] Corrupted time and alarm calculations via contradictory fallback usage of QCOM_RTC_GLINK_TIME and implicit 64-bit integer promotion.
> --
> 
> --- Patch [2]: [PATCH 2/2] rtc: qcom: rtc-glink: Add PMIC GLINK RTC driver and extend pmic_glink ---
> commit 453a7a32b4bd6fbb186e249935eb4448bc3ddd38
> Author: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Subject: rtc: qcom: rtc-glink: Add PMIC GLINK RTC driver and extend pmic_glink
> 
> Add a new RTC driver that communicates with the PMIC firmware over the
> GLINK transport layer. It supports reading time and alarm functionality via
> GET_PROPERTY and SET_PROPERTY opcodes.
> 
> > diff --git a/drivers/rtc/rtc-qcom-glink.c b/drivers/rtc/rtc-qcom-glink.c
> > new file mode 100644
> > index 0000000000000..611f06a3cc5ca
> > --- /dev/null
> > +++ b/drivers/rtc/rtc-qcom-glink.c
> > @@ -0,0 +1,690 @@
> [ ... ]
> > +static int qcom_rtc_glink_request(struct qcom_rtc_glink *rtc_glink,
> > +				  void *data, size_t len)
> > +{
> > +	unsigned long flags;
> > +	unsigned long left;
> > +	int ret;
> [ ... ]
> > +	left = wait_for_completion_timeout(&rtc_glink->ack, HZ);
> > +	spin_lock_irqsave(&rtc_glink->state_lock, flags);
> > +	rtc_glink->request_pending = false;
> > +	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
> 
> [Severity: High]
> If wait_for_completion_timeout() expires, request_pending is cleared. If a
> new request is immediately made, request_pending becomes true again.
> 
> Could a late firmware response to the previous request arrive and be
> mistakenly accepted for the new request, since the callback lacks
> transaction ID or opcode validation?
> 

Ack. Will handle this case by blocking any new requests after timeout.  Mostly
the timeout will happen if the firmware is stuck/SSR happens. So  will unblock
any new requests only after an SSR completes on the remote firmware. 

> > +	if (!left) +		return -ETIMEDOUT; + +	return
> > rtc_glink->error; +}
> [ ... ]
> > +static int qcom_rtc_glink_get_time(struct qcom_rtc_glink *rtc_glink,
> > +				   struct rtc_time *time)
> > +{
> > +	u32 ticks;
> > +	int ret;
> [ ... ]
> > +	ret = qcom_rtc_glink_get_property(rtc_glink, QCOM_RTC_GLINK_TIME,
> > +					  &ticks);
> > +	if (!ret && ticks != U32_MAX) {
> > +		rtc_time64_to_tm((time64_t)ticks + rtc_glink->offset, time);
> 
> [Severity: High]
> QCOM_RTC_GLINK_TIME is set as an absolute time in qcom_rtc_glink_set_time().
> 
> Does adding rtc_glink->offset to it here in the fallback path result in an
> incorrect time calculation (Absolute Time + (Absolute Time - Uptime))?
> 
> Also, since rtc_glink->offset is a u32, will a negative 32-bit offset be
> zero-extended rather than sign-extended when computing
> (time64_t)ticks + rtc_glink->offset?
> 

Ack. Besides the problem highlighted, this function seems wrong we do not need
to get ticks..  julian time is enough, so this flagged calculation will also be
removed with that change.
   

> > +		return 0; +	} + +	dev_err(rtc_glink->dev, "all time
> > +	}
> > +
> > +	dev_err(rtc_glink->dev, "all time sources failed\n");
> > +	return -EIO;
> > +}
> [ ... ]
> > +static int qcom_rtc_glink_get_alarm(struct qcom_rtc_glink *rtc_glink,
> > +				    struct rtc_wkalrm *alarm)
> > +{
> > +	u32 fw_alarm_time, fw_current, alarm_en;
> > +	struct rtc_time now_tm;
> > +	time64_t now_real, secs_until_alarm, alarm_real;
> > +	int ret;
> [ ... ]
> > +	ret = qcom_rtc_glink_get_time(rtc_glink, &now_tm);
> > +	if (ret)
> > +		return ret;
> > +	now_real = rtc_tm_to_time64(&now_tm);
> > +	secs_until_alarm = (time64_t)fw_alarm_time - (time64_t)fw_current;
> 
> [Severity: High]
> By casting these 32-bit firmware times to time64_t before subtracting, do we
> lose the 32-bit modulo arithmetic?
> 
> If the hardware counters wrap, will this produce a large negative delta
> instead of the correct positive duration?
> 

ACK. will handle this in next version.

> > +	alarm_real = now_real + secs_until_alarm; +	dev_dbg(rtc_glink->dev,
> > +		"get_alarm: now_real=%lld fw_current=%u fw_alarm=%u
> > delta=%lld\n", +		now_real, fw_current, fw_alarm_time,
> > secs_until_alarm); +	rtc_time64_to_tm(alarm_real, &alarm->time); +
> > alarm->enabled = !!alarm_en; +	return 0; +}
> [ ... ]
> > +static void qcom_rtc_glink_callback(const void *data, size_t len, void *priv)
> > +{
> > +	struct qcom_rtc_glink *rtc_glink = priv;
> > +	const struct pmic_glink_hdr *hdr = data;
> > +	unsigned long flags;
> > +	bool pending;
> > +
> > +	if (len < sizeof(*hdr))
> > +		return;
> > +
> > +	dev_dbg(rtc_glink->dev,
> > +		"RX opcode=0x%x type=0x%x owner=0x%x len=%zu\n",
> > +		le32_to_cpu(hdr->opcode), le32_to_cpu(hdr->type),
> > +		le32_to_cpu(hdr->owner), len);
> > +
> > +	if (le32_to_cpu(hdr->opcode) == RTC_GLINK_ALARM_EXPIRED) {
> > +		dev_info(rtc_glink->dev, "alarm expired\n");
> > +		schedule_work(&rtc_glink->alarm_work);
> 
> [Severity: High]
> Does this handle the RTC_GLINK_ALARM_EXPIRED opcode and call schedule_work()
> unconditionally?
> 
> If the driver is actively tearing down, could this run after the device is
> freed due to the devres teardown order?
> 

Ack, will cancel the scheduled work, in the remove() call back, and also
unregister the clients so no new events are reported.

> > +		return;
> > +	}
> [ ... ]
> > +	switch (le32_to_cpu(hdr->opcode)) {
> > +	case RTC_GLINK_GET_PROPERTY:
> > +		fallthrough;
> > +	case RTC_GLINK_SET_PROPERTY: {
> > +		const struct qcom_rtc_glink_msg *msg = data;
> > +
> > +		if (len < sizeof(struct pmic_glink_hdr) + sizeof(__le32)) {
> > +			rtc_glink->error = -EINVAL;
> > +			break;
> > +		}
> > +		rtc_glink->resp_value = le32_to_cpu(msg->property);
> 
> [Severity: High]
> For GET_PROPERTY responses, does this assign the property ID (e.g., 0 for
> time, 1 for alarm) to resp_value instead of the actual data in msg->value?
> 
> Also, the bounds check only validates 16 bytes (sizeof hdr + sizeof
> property). Does this need to validate 20 bytes to safely access msg->value?
> 

Ack. This opcode is wrong, will fix this in next version, and also correct
response structure, which will fix the byte length validation problem.


> > +		rtc_glink->resp_valid = true; +		rtc_glink->error = 0; +
> > +		rtc_glink->error = 0;
> > +		dev_dbg(rtc_glink->dev, "ACK opcode=0x%x resp_value=%u\n",
> > +			le32_to_cpu(hdr->opcode), rtc_glink->resp_value);
> > +		break;
> > +	}
> [ ... ]
> > +	default:
> > +		spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
> > +		dev_warn(rtc_glink->dev,
> > +			 "unhandled RX opcode=0x%x len=%zu\n",
> > +			 le32_to_cpu(hdr->opcode), len);
> > +		return;
> > +	}
> > +
> > +	spin_unlock_irqrestore(&rtc_glink->state_lock, flags);
> > +	complete(&rtc_glink->ack);
> 
> [Severity: High]
> Is it safe to call complete() after dropping state_lock?
> 
> Could this create a race window where a preempted callback completes a newly
> issued request prematurely?

It is safe, for two reasons. First, the RTC core's own ops_lock mutex
serializes all calls into .read_time/.set_time/.read_alarm/.set_alarm/
.alarm_irq_enable, so there is never more than one qcom_rtc_glink_request()
call outstanding for a given device - there is no second "newly issued request"
that could be racing for the same completion object. Second, the timed_out
latch above means even the *next* call (after the current one returns) can't
arm a new wait until the previous response has been drained. The callback's
"stale response" path (request_pending already false) explicitly returns
without calling complete() at all, so a late response can only ever complete()
the request it actually belongs to.

> 
> > +}
> [ ... ]
> > +static int qcom_rtc_glink_probe(struct auxiliary_device *adev,
> > +				const struct auxiliary_device_id *id)
> > +{
> > +	struct device *dev = &adev->dev;
> > +	struct qcom_rtc_glink *rtc_glink;
> [ ... ]
> > +	rtc_glink->client = devm_pmic_glink_client_alloc(dev,
> > +							 PMIC_GLINK_OWNER_RTC,
> > +							 qcom_rtc_glink_callback,
> > +							 qcom_rtc_glink_pdr_notify,
> > +							 rtc_glink);
> > +	if (IS_ERR(rtc_glink->client))
> > +		return dev_err_probe(dev, PTR_ERR(rtc_glink->client),
> > +				     "failed to allocate glink client\n");
> > +
> > +	pmic_glink_client_register(rtc_glink->client);
> > +
> > +	device_init_wakeup(dev, true);
> > +
> > +	rtc_glink->rtc = devm_rtc_allocate_device(dev);
> > +	if (IS_ERR(rtc_glink->rtc))
> 
> [Severity: High]
> The GLINK client is registered before the RTC device is allocated.
> 
> If devm_rtc_allocate_device() fails, or during driver unbind, the GLINK
> client remains active while devres unwinds. Could this allow firmware to
> trigger qcom_rtc_glink_callback() on a freed rtc_glink structure?
> 

Ack. will unregister client incase of allocate call fails.  

> > +		return dev_err_probe(dev, PTR_ERR(rtc_glink->rtc),
> > +				     "failed to allocate RTC device\n");
> [ ... ]
> > +static void qcom_rtc_glink_remove(struct auxiliary_device *adev)
> > +{
> > +	struct qcom_rtc_glink *rtc_glink = dev_get_drvdata(&adev->dev);
> > +	/*
> > +	 * Nothing left to arm alarm_work after this returns: the glink
> > +	 * client (and its callback/pdr_notify) is torn down by devm after
> > +	 * .remove() returns, and rtc_update_irq() below still targets a
> > +	 * live devm-managed rtc device.
> > +	 */
> > +	cancel_work_sync(&rtc_glink->alarm_work);
> 
> [Severity: High]
> Since the GLINK client is managed by devm and hasn't been unregistered yet,
> could an incoming ALARM_EXPIRED firmware message re-queue alarm_work
> immediately after this cancel_work_sync() completes?
> 
> This might lead to a use-after-free when devres subsequently frees the
> memory.
> 

Ack. Will call unregister client here as well, before cancel work, to avoid
getting any new incoming alarms.

> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260807-rtc-glink-cleanup-v1-0-7801e4d69c4f@oss.qualcomm.com?part=2
