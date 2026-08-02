Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B72F39B4
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659445; cv=none; b=gxTBI8ta2SLJG5ENNwV56wEkIwm7yLgd8m1ggV2GwQvVnLt69QQNnUJUcbD/TlO07zEsVhNhhtfsgjmynPvSNGMJkijcoXH1XIk56zqtdb5BlIirzBTgC/r6stgF/be++mtDLJzRICbh3qxgkG6MZyDv17DQzAe5+mXBSv52zGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659445; c=relaxed/simple;
	bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TU2cNN2JjozKtIEDLr2hdFfLmwUIgsSSwIkBup8QAhhUPFTOwZ2hQNTnqs5lYAs4/ARFiQJM0rJb0Nkn9C6YDvjV6Hzagzuy1Oapmvx6109+VCWk4P7jY55WNHP/OkK7HbfvkVJ2puAJtmNKo1Z4JIrK60OS+5OgJD21cfi4iw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=azz6523I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql7zawah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="azz6523I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql7zawah"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727llaO2271946
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=; b=azz6523IdKYvm+PY
	s+AxcWLjtxJWC5jAlRWX+z4L1OdsV50oh1xUD6YCt1z771WWePs5YtQIcJKmJBdS
	2kswLEsl1JLCY/8TCA3noIJ6e3nXnXm9LcmMi/EkgRuYebtf7ocY0GdLp8NppMjE
	wE3f8kQZZm0anag6bWrtZDX/XhHXKvV+sSPlquu8OZ7KpfDUkpNb0uNgo0mjhZaW
	WzzaP5wE2Mo2DLgeqhXyecNtVs+SoOozdK+UOoQHZzI8St0uzpQnpvINeTJYuA7s
	/Yiy8hHMaorpDWjPmILBQG3aR1oyUjhOCiSScW/HuAwlsQpdkSilywplYLWl01/T
	qFf6ew==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg2fk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:30:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso47810611cf.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785659442; x=1786264242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
        b=Ql7zawahHTIUkPhiJWDQW8gIFI/653ct6IF6+lZt9iOItez/RIBgMhGQdH/g0uv1gZ
         44VdWwZmz0pZcVHdtn6oVAtotaD9iWKgY/zjwtgXB2Vw4irmXh+2qMPCuJNGx6geHUig
         ByeIzxehrDKfhRDtb+3y5N04s9aDUHFuwxTF/UPGh3hRf/FRkRk5EjEwC2wNFtvvFoeD
         jPRSGRUJ745rZKb8WlHAjaiC2KZjgUALFCbhzbOIP4E2I/jQTefiNS/Vslmid3CGmwmG
         c76IxJD96LjCYTbGvRtRgM6aoJFzpLvqqObmBRfpWob9gS+f6SLvy5pEb8mXfSBaVS/I
         VmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659442; x=1786264242;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyAdsxHoCmcxUOb4mhFfepOiXGzQmQF9yGDLT17wCGk=;
        b=D6gosJcEHsS8A4xLUYWyQ07/THqLWCvA0xMR7S29836fAgfdfczwbso2ybGDgI1vKj
         V9IOBD/K2ZkA3peBhLhHzCf1o1lMzX0RVzSF9g5UVDq7AmrRrDC+md0EXjKbU661z6Mx
         vf3Ft9bbNl8iZ0Xr4JkPQNa0RzwU01Z4jpnlL2IIrAPxqTaUbsnPvzQeqyFyIRS0XcsX
         Gc3NDCi5t6baVlTkBjIBYwtdOlxV05VBlg0n5UQYzlIOYISgiMrzFPUElTRNxr/4iN79
         QrnLyPpD7mMqqjore7XTKhSTzwIr5GDlwfr3OgnU/sZW9ubmNWLfyPGjYwkHB0QWikgi
         weOg==
X-Gm-Message-State: AOJu0YznKK9L7EHBUdjh9T5CtwdV8QJc0YReQrvwHx1WCthbxO6uOPW7
	7kDFs/0j0UebZRSUk1bBXEKr/Q7tjGhtmG0kE+9Hz4anbmFbJkNu5dwNJvFLTHrt3LWA13w0Zv1
	757NNtzjf4tKObnEhamobj75xvL/gFd/GtVhWt+sVcakYPc1eUYX0j03Hb6acsgou+BCyFz/2
X-Gm-Gg: AR+sD10MMjQ4WwYuYV0WeS0JSNLaQpPf9sC77ewQc0yIR6GGbQvkirWbGN2Vdu171JN
	kX/MgErlrhQ49QUoPnx4xbgf3ZQ+at2RVw5dVgv00QRW1ZwAkg1oyt8C709xhvdFJRjMbpcSjwq
	jDTlWNIly4WRXlshBmgyGlhSsWVThiYTwVDkqG7f9B51XZhYq5WRdUIx3YaL+IXaCUCUZ36NXQ2
	0uvcBtnTeR8ejnODvSL3lR1GSNqPiYheRP8zwwh+GzwlCBAMJK6grE5XDsxBJjFg24nmV+ezJiP
	bc3ocV+Ju6hc3y5QywYbdJkYRy5EsRCg4awJ+tFPg5z1raE9c9pelNH+lpv9Z7Je+myPEH7rKRF
	jixTi0LfiXozi7mDmwSD//cdmTEAhTw==
X-Received: by 2002:ac8:5ccd:0:b0:51c:404:af7a with SMTP id d75a77b69052e-52b567915f2mr124157311cf.31.1785659442362;
        Sun, 02 Aug 2026 01:30:42 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:51c:404:af7a with SMTP id d75a77b69052e-52b567915f2mr124156851cf.31.1785659441941;
        Sun, 02 Aug 2026 01:30:41 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm23027051f8f.0.2026.08.02.01.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:30:40 -0700 (PDT)
Message-ID: <fecfa8a3-d57c-4c0e-82ef-9a2c89182e3b@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 10:30:39 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] dtc: dt-check-style: Introduce 'stricter' mode
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
 <20260726-n-dts-style-checker-continued-v1-8-b05b8f897670@oss.qualcomm.com>
 <20260726155452.5BC6A1F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260726155452.5BC6A1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6J_2d7SR1IBCo4QW6pJBFnXWBAXeaSJ7
X-Proofpoint-ORIG-GUID: 6J_2d7SR1IBCo4QW6pJBFnXWBAXeaSJ7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA2OSBTYWx0ZWRfX5PJ4fXhQJci5
 UFn0+pG4QVMNvahagS8z8Rx+mXxfk0W/NSX2ouBXsDTFjHs9khJAspTArRDIoRC7GjIWLFJsSS1
 r79SH0cNEZyIlRWlSbNfTmxBv37HCG8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA2OSBTYWx0ZWRfX2hM5wLPtwXDC
 Ce8LMSudBGuFZMcuyMvPrL/SNjiRXIspDhfSutNWgX2WQe1p9IUc2g19Klz1rxMHcoEk9pq9Lwl
 8FdITZF5cu1ENQ+aFx9wKx+tkTQWq+YG3XCko+zz3fL9Fu6+hIC+m5m44TTcBgOvSyC3yWP9MZJ
 PVeOLGOzEqsfyHKkgGK9VdxjkMSHvPDAb7hxtEKqJ08q/k1RYlY0O3HqwxnoOgXbdQJoIR5Ax+c
 mAF1lrCF9tT/RF/aDk//4Ct+DjrnUJ4m6moa2NO5AXR16PNF2WCDa2vNhSP5TrdZr+zZlW7kSNT
 saC5/fhfqFSlI9c4uaqIupxLv1KJbwdi+l8jY7LlDyTQzTNG951kcwhfx+yHUY7NhVvG1fuJW5c
 OK6OINvNq97Mnw40A51/1gu6UxcOYWrW9mfziQ0WacjUbgVNz98fuWzXDZdUBWK2QtEt37MHLQe
 VfSKEvCnNvNyh64NRGQ==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6f0033 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=2E1vlt1IBdFnViGJDXcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020069

On 26/07/2026 17:54, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Missing trailing commas in `applies_to` arguments cause them to be evaluated as strings instead of tuples, breaking the `--list-rules` output formatting.
> - [Low] Misleading documentation for `Rule.mode` claims dictionary support, which would crash the script.
> - [Low] Copy-paste error in the header comment of the `dts-line-length.dts` test fixture.

Ack all three.


Best regards,
Krzysztof
