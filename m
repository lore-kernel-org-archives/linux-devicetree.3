Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238880;
	b=GZUwWBSgOR8C5RjAYwM3f2XVpMjj4BMujbdkAvWQR0r1OlS0iRitewN1tSAchRGDvStz
	 GxUiNlYInhUihdDHX/qeQZFiimbdF0VATIVuNbBpQVvCvSVULvIFiOxgxKO/bWlrTv40L
	 7fb1/S4EMMzzGngdvolKCN9EXd8YFnnALyNhMxo56IwxgbG0SZnVd03hjSMQFo2EDTbhX
	 JaVs9Li58Dnt51TGAUo1zv1x4+JZnBrM4a4CEaBa4nb3zA44XiJ96nrLeLf4rwJK4xuHY
	 0do4H7tb1BeTP8NQRk3hpAh7ce4q1IYVz/KAAkZzSjCyioav2Ct1ePQFbXAUKgH4Gew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
	b=ua59DnnL33+EqMelXI0LiKe5AkFRKBNW/JamO4FDLaZvWtVMArDa+a8Hf0gij0q59Kuf
	 FQ8qD6ptcX/5rfhod1SgMZpEqYONIHR7x96PsKZRDSy73EFu22mPynwPb61YrAC/C24h/
	 lSSIRTaPNVSf6zm5QBpQJ3Ph9t4xdx5Fb1edwaPG9s7lDU/pNjFgViobo5KlpaJ5X1xiJ
	 Pneco3AL+dGKuR+vsUPcEJ0nJc79+DCFGev5KfRltQN7sIXvsH2u3AqPT/Pv1JFR4oMvr
	 lEmuN1F54MxnS4eyIGovaWBeWzNQgjHLzVxn2s4l7l0EHRQ2M8rJlJfralez2eqCVgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131F606A321
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7131F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LIW+o5OM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B8ibVMl5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFKEi3588625
	for <devicetree@vger.kernel.org>; Mon, 9 Nov 2026 15:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=; b=LIW+o5OMMmMHLBd0
	ZqN+Pt9cKAj5QI3KuNcKB/ZAXCK7Zja7T31Ro3zZBnx/olamMqxfRqZ+iDKxnOSg
	RZSN9SyLbYZJ6GQu4Yoj3IOn3c5Jbfhfa8JYWJZHBAW8OC8sLSnER0lHNGCEeCFc
	IWL6IqI+1nVCTaamsUVIfp1Nop0TdjBpT4cAyEomo9zGllM4iIF05QOxVrljU9e6
	EdG+b3+ZeDYeS8W7XsQLujBO3K9+WD+UMXjaOhmauB63ac1Shm5BY3D9mGHzb7xO
	g4LcooH0RjT5nmnXAZ/xOF7oohShEAjp89t8q6ZT+mXlqpMX6odtNKSDmz4Sy0MD
	Rdf4Uw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudcj8u9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 15:41:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso23059185a.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 07:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794238879; x=1794843679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=B8ibVMl5tndTYPU4dQseBgIbignge38JEiekrVZYvYNLfj0ePjCEvcgkH8CRRO42RY
         qJ+9qMcbcYuAnzLDWr01f8H2gQNNW+OuYlEWZ8Q3GvFBfrLEj9Pdx0K31NbwXy53Ue2s
         JNUNdQMmRSw3nzB1knUCVvXF3iagZ25Y4BfVsuGu+dnaSU/wRa6ESr4gitoDuUzheSJD
         WQZUdkA8xzfswUt81T9pEQqmu0FUAC/Em4p4KXnQUV44DBywMCKv9Swr77pF0uxjsSlX
         xggmIpZYoJz/rZ4rGBbORjQPY16aDhSzShDJtbqEC1m7G5qeZwO20oKkruleqPBqJPHN
         vgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238879; x=1794843679;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15rx6dd152mXC9BolOmfr6zh9OId7Jtt7lhati6ZiOQ=;
        b=PlDVBEYL8GrQYVXEaajKnpf3uGMZIVVEurVnjkchWwL8sEx6I4OdvqeJK+10SZfZmr
         Aou9baVohSuvoGQHRUjIFBIxakgcWLhnAFOOz+mHpfAHeQcpQd+lXAJKeG5NSEhM7YUy
         D0uCHRiUW+ICoZii51Do/ticXkFDfjmHAp6aWV2LBMk46je7BHZ4eWlJEOOpw3vknLS6
         hVjN25sy13rZ8CEVYrZMFjbSs3vzZqrEOEgeUo5PUZwehJSUGkihbUq/h/X41O8FtkFl
         LqEJGyP0tAn5T4focPXtKWrZw+r1k1nKWcPhYLZu7ftQSofnKvPiDDDNheD3avlothUx
         M4Ug==
X-Forwarded-Encrypted: i=1; AL+hErEtkYpsGNSICp8lLYk2ST9fwrQuJC/Srp9cUqD7f8h8LiJumSM7B5ekjhMBGV0xqIwFl3d48Kbv6cio@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vr7NOTTKwlTtoyuzOjoxLmcXEC3pOSTT0aZjOxO38IhIF/IPq
	2HHMwIqeM7+fCCY4ehQs8NYRziZNlsevERUJXbqsmv/J/H46j67ad9kHCmeKJgAlBr52K/fVGcR
	a9gy1m/4ghUXsyAf22K2HySYt4y0nwvZ96SF87zg1cZDSkIItHAbMp4gNDOeHTywC
X-Gm-Gg: AYBFou1+4lxA/Jicvwa3SM9yHwcqVU3Q8FvNIvbwXgufKlD+KhwDa7pnQ5zLtww8TrI
	2AkvPDdfjCAZnFObaZp6/05DQRMsL6/1gMTlex0qS2nQ3htozE3Veri7/LDR27V23oJlv6zowP2
	0eyy/ZHvU5NUcJZ+PNMC1xaEjO9jAWPH3w161q8BOZp3w2lKoc0dRx6lhb2Re9QcW2YKhZ2WxdX
	SidctlQ8HyzYTq6sPYeEjItLS81sv2k5AxbF/9UC4pgQp+MQBRgrFELCx+TOnzmK4xN2nSLHNAW
	DObWEcUlq1lm3h7DnoDrhmhGwerjRWamZhjMIXgUhMlrwmwZpev2DlMrcvv+2QND76pA5wodski
	aZrSXwlpCV1JD17pRlmXr2ObGgVIPQ0yOjWG18IhMk+oo9FH3S3oqIQPM4vVHVC6HnRrWCw==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660952385a.0.1794238878597;
        Mon, 09 Nov 2026 07:41:18 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr660948985a.0.1794238877975;
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b755543354sm33732a12.35.2026.11.09.07.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:41:17 -0800 (PST)
Message-ID: <427e15a6-cbb1-4c3d-9547-cfaa08fa90b3@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:41:14 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the HDMI port
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-t14s-gen7-hdmi-port-v1-1-1a691e6c180e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M-ezofrx0yo10G8z8D1VQG7xZya-HDiG
X-Proofpoint-ORIG-GUID: M-ezofrx0yo10G8z8D1VQG7xZya-HDiG
X-Authority-Analysis: v=2.4 cv=au0nmiZV c=1 sm=1 tr=0 ts=6af1e99f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=WC968W-qZJN9GzRUQ40A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX/mAUunfbkbff
 3C69wWglpewlG3tWZ11T3tyyXNQp55RyJHefzSOZuGQVZmWqAXovO+BZ6F2OGjPQABSWjuLA6GD
 /U5xATi2MDRzWMqw24CQxRE3CMBGAm8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX2YIR8KerKp/2
 vHw2bcRLna05sXnXWCFzM5gpylkKaTnpJxxGwfu6Voa19x9KEacc3Vsi6TK7XEdX+ZDvrsv2r18
 2/xbHHKgy+CZYcXINKYbDCTySiarkYjMYyLsVEeXIXI3ipcXxU6PXXINp2msE6F7K9gAHrhhlEd
 dXAUS5h098dorTAGGM5bmMED97gIr20gWhGsV6gfYpmOPMAa13hQkEqZ0Ko+RIRM3WQ0ULgA/Cd
 eF7tL0tXMipY80gcuCXZ1Endf0zxjbnLJA0ludDPQ0GFsz9zvZMwr3K8QgKttVgiVa12TX6AeHs
 SPNQ7x2v2kMIZ8YAIEqYLVj/Ee7kr7cmvqpoEB81Y9OCppZuHyjk0MCjAmXpf0Fyg8moHdZI6so
 Ti9XS5Jm+TsDG/fRxBIBEdBC2bvHzBc8RrtDY0sV8fdHfNz4ovu6en0IzasUFX9VDZwb+igysjb
 zhhN0yxZdxOvoCYtLkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090062

On 11/9/26 10:06 AM, Abel Vesa wrote:
> The HDMI port is driven by the third DisplayPort controller through the
> DP lanes of the third USB/DP combo PHY and a Realtek RTD2171A DP to HDMI
> bridge, with the HPD signal on GPIO 126. The USB3 lanes of this PHY are
> not connected, the third USB controller only serves the eUSB2 port of
> the fingerprint reader.
> 
> Describe all of this so the HDMI port works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> This depends on the LDO voltage fix sent separately, as the combo PHY is
> powered from one of the rails it fixes:
> 
> https://patch.msgid.link/20261108-t14s-gen7-ldo-voltages-v1-1-e0ad0d528767@oss.qualcomm.com
> 
> Tested on a ThinkPad T14s Gen 7 (LCD) with a 1920x1080 monitor: the DP
> link to the bridge trains at HBR2 x4 and the monitor shows the desktop.
> ---

[...]


>  
> +	hdmi_hpd_default: hdmi-hpd-default-state {
> +		pins = "gpio126";
> +		function = "usb2_dp";
> +		bias-disable;
> +	};

nit: order

otherwise whichever way we end up merging the dependency

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
