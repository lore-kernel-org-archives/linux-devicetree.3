Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898BF4C6F0E
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985342; cv=none; b=caL4eXPngXrDahS0/yTfpfI052Enp8MvVLhPcMAxAd1nzlnzaXONaa3iFbafx95/fOZZciQj7XNu9YcI6/wr3iaPigC0tj288VGNH+G1w6N5XdrPGm1+krI8jN2vgQ36SkiSCd/ZD3hrUVDQ62Nx/Be5b88b2SP9vzEexxL9XiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985342; c=relaxed/simple;
	bh=SAnoNgk+nST+SPcfQje9T8ufskN92qCUkOP7FwGriDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uULshnZwylw186JF5m+RfnQIrRd9Vg2pkLZOe53/J148YAFOVvz/nZTtqQO2G37DQ5IweLe0LwL3ucdVOmFphA8HCDN63prDiMWwv5XZixfb5i4EPnEJSvUIcBa/NSEwtQhA1fQcNAqv2FXev2FdG44jQzzmv4L0901/mX5q0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kjhkZZba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EWOIh3tZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kjhkZZba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EWOIh3tZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628XCcU3046476
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 09:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=; b=kjhkZZbaZYveYXYy
	SEYIjSnpaz2aI1z0A9TQ57KsNGZ+JJU8mUE9LHLFR4I3iHiBf5UowxT/SkqHOid0
	HX7pvNeIN4hCCO1w0J/7iu5VyCqM3Y3ac+/TnuKDzaoyL4RDN5wdgw8GqmKHR7pX
	0+Wu+RJsL6HKqE5qTLJMeCBpI2dJmWyFAK+oHQqN+Q0xFn9s7B+2e1xyeZhYaLZX
	eu9HKsR18qCgPKyYMjj+IakpO3/D+BLIYHyvcTZ54Mv6L36DopJfa3NmL4iRcaBF
	2Zjga4+myp3lVIcfx7pgVliMdTsE4zumP538rtpzTvo1RuamQRBVJlSdzgbJUZte
	fK7LkQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f58k3av8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 09:42:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e57e56ce9so31240485a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985339; x=1783590139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=;
        b=EWOIh3tZhqQbzhRzxAbXlZzVUnnOL1Vhd91wWQ+BarTGcjlpK48u0YYBEwunkWK9bO
         IOBN/n3ezA+u73cmeW6XKcFbwN/DpN4AsGksas6Zh46hJQb/5MTJ/O5rQLEUd2px8dBc
         5BxQzYSK5EGByxHKjRcRidsUAcZvaLL78Q3baSiwNayTIUWCgQu189dI0KREO0RqYqg7
         Cz6tkd5MTNToh3u8EEJZhSZIjxiRqap9jdL/3p5xTMhXaLKCr+rZhdaX2kEzFU8fUO4C
         1tXJHAWoX5MmZXVvCMROE8DWPOfXv3W/+Vrzwoa9/pt7urTNuS1ie3XMp1U2TF11G9LC
         fguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985339; x=1783590139;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fR0s+M/tWw+Di7Ypu7seoP6nVnfihF0HUAjt6FvNy4E=;
        b=tVwlqOXiCRBZ9SjjuCFVkKoQiaSUIFRld59WtEv6mvTSFhuzEmBxUz2GNZmZz0sGZz
         KlobxB4Mzk87Wz/4vQTMvlR1SHfTrXp07+y3SzX8gYeHkC8yNOqFJ5jjaBIzmNx5nzn6
         E3wfwsv3sc4vtGWIXn2XQIqqTvVIqcvz0/c9G4xD/0yN+Ib31D+YyITy6aAOYamK1Pno
         3A1xqEsFdNkUlbT7twdmtKYxGkePaw4fwO8K9e+bIgvm32p6OORJPNhNo7fhhXNXGzg7
         AxQC/GkOf5xbSxQxn/KHQv9BtuoWaupwbz7yM/U/7qMisdE6Lw9jXO0tEHHI7QQgmXk3
         6Afg==
X-Forwarded-Encrypted: i=1; AFNElJ9flbLK+FjY+c4dmUlr4RRwlck8Wbj2fYzaHaVyYsNYLAphCrGLc3x2dxz0973brT4RgSO0SRTD16l0@vger.kernel.org
X-Gm-Message-State: AOJu0YycJeWa8FggVJdCBpvi7NO+rUOTq40YBnVc7lqA6PKxzit7r4J6
	sdxVOrWvgxNOUSAo4PetNiuMk0DmCNwQ7rJqfvRWjdHKCxQC5ZT+bUr6sVznvJcc0Ldsc52tqOe
	GW+UvccO2r3mnPXKL3aGZcVUeR25cTr27EsshOjJBvvRTAKBtAXJsudT4m/g9dB5+
X-Gm-Gg: AfdE7cnC247M9igN4ILw7De/6HIHwxwax7j55JpMDxcqrtVtR4i1+DpN7VTSNyGJkC/
	aH1yPbJI/9N7j9oPCZO/D9WAjng09gXOEc8Y+t9zxkYsTt22MSmNYMpA/qolKs5vHdN/f/7vL2Z
	hZ2LLyCFSUiVG1qaaRIhAIUcZoO8kyT41KjJzvh0gQzpRohcvbATep9KDpu08BvuIoGJ2rqlfhb
	WEDyAeIOEIYSzYHl9/l/ohprzwlX+qTDDCMHKcp0KyfBK45zXrcO4OVV6vRbMqaz6AeueIU2nzl
	7FUg91H8dXxAqWF8HfOLXiLD6PN7+lhFH4byWKkICqTPXxM9ML1r26NCoknpP1D862cd+I5WvTk
	ebO3BwHPiJiS9yV69SSjUbCcm3kPfVUxCgt0=
X-Received: by 2002:a05:620a:4609:b0:916:1a60:ee05 with SMTP id af79cd13be357-92e7809d204mr439346385a.0.1782985338871;
        Thu, 02 Jul 2026 02:42:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:916:1a60:ee05 with SMTP id af79cd13be357-92e7809d204mr439344485a.0.1782985338475;
        Thu, 02 Jul 2026 02:42:18 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6091ba1sm99077566b.17.2026.07.02.02.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:42:17 -0700 (PDT)
Message-ID: <22bc584f-7b00-448b-94f7-347ce346b589@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:42:15 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Describe the ADSP GPR node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260701-dts-qcom-eliza-add-gpr-v1-1-9cce16219dc4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX7wjgq49CHn+k
 iwsbS0LX96Krf4WdiL4Z55oqAKvjA1Rt/i/d/cVQag29bO20jL02ZF3OtcpPgfI74VMhZ3wiWDm
 E8dez1KRVPFs02TlGTHU4kwaT1DnavN41xyrZfunG3bRTAUR8XDMNV4sk8KZTS+apv3de4KL6dE
 00TNPC7pBE0SnwIBSUHActaEtT8qxJBzey2Ma4PlcP3LPUJOgIeFeJRYrIMGaYBVazN/UMjONlI
 kNVVTfb7uctcG+Mlnck5UahtUuaqg4Rbte4AX+kSs+NpPuqdNPp1OqdCzaNC1Y+FYSAFBP/1VUe
 lxf1NZNHRNwdew1kGiyA10ui+ZeXhbEsACC9W5rxXZNgbWXn3SvJs/0Ew2ye5WyJoxJ41oX3k0q
 Jb1B49mzU70q3AF2ryOU0jyxMInQe7LaDCKD+gDnqWMFA7KiL5WyGlsroBxe6GPsn5cKFt8+A92
 MJDc1OvtVCDmf+0WL2Q==
X-Authority-Analysis: v=2.4 cv=SuGgLvO0 c=1 sm=1 tr=0 ts=6a46327b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tZpzCwSzTtfYxpM6NqYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX9hTom2lRbK4T
 AlvyNpWQjG93elcLrm205A38QvKAfDmPtIu7Zuuo8q7ob6F2c2jipnuSwB4AmU/MAnFr+VyyxjE
 bVMNgFUtLL/7l6WoZOFV9UHiuG1QV9o=
X-Proofpoint-ORIG-GUID: vmpRyleLJDyhtjgFiaN8-cMSZ0xVdhmi
X-Proofpoint-GUID: vmpRyleLJDyhtjgFiaN8-cMSZ0xVdhmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

On 7/1/26 2:05 PM, Abel Vesa wrote:
> Describe the ADSP Generic Packet Router (GPR) devicetree node as
> part of audio subsystem on Qualcomm Eliza SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
