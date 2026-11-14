Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794641791;
	b=EpRHUNk4gypx7kXiksym4ohMr3UyszuhIhH1WGNh9nR+qkHcJiWDVJoCsLzRU413iPMj
	 /ggt5qXV6D/hMHK6iKoFvKFRb2v/YCfBEPs9zgno6rezEdT/rn214WYjdxb+I7ci6gdNG
	 926AeQf1P71oQocN5R6fAA3ScWIpNZZCY1/q0QNw8wOvMYAP7dXjLKRL6wESEh4BtVNSv
	 K+OuvOPCi6URP4Vmzjar5p/0DobeE06lziOVqCcU0dwpAFswzDyFBMKfUKDiUrYVYa57t
	 6HXjMFyKvIOmLJWaHb/aRdrTdzDc83w6CYePqi6QP3YYnvygnUHNh3Ec+BvAqYLHTJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794641791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
	b=rgB+orUEMDFkow1itDdh75/5+mDJQrEx5ShuWRywrA6kZcddPpXxu9nothWIUFOmZW6z
	 CPsXiv5VsCY5P18U8fLTGrQG08KpWsHzXzPA8xskEy+45rsOlb2Z7gzUcjsZSBViniQqH
	 d6fmRQzKZ1bkk3E7l8nnpGdzXNEx592p8110Esbd8MMaVwMBwm62gMLOR6a6xUvc5vcxp
	 IR99vKMhpdcoRCkJMCDXUf3et9gWUzpT8PyD/AHSewqs/h8z0VGJul874CPijVD1TO0D3
	 IbzgrxtWBlcPl498mIA0axgaZ92F5Wla+r13OowWH4bdYjh8k/ttO1TnPNtdBdCvyfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8GbARHd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKmz5q2m;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EA5606A886
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:36:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EA5606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p8GbARHd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UKmz5q2m
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61Dki2891614
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=; b=p8GbARHdooMNXeqv
	Zkv6uk/x5rBePH5QsOT2AC9pmM6Qc52On0W0aEl+ycGtXiYESxalPix+PQtx0tv1
	o57ioUbF00ZRnIR5ROqayo03An+p12vJtw81OGb03WfrV+ADQaQaEu3lDQ0i8nAY
	3W/S/XcEgXOH7T8kXZlaS5N4NLEuz+N/B/figu/bKyGTCJ4O6dtjfAC7E0GiQ1Z+
	BZOJkMT9N3odql8+G8PqdzrJi5sMimrIzezKODeyNrwHgwaESSFyzJivA4cIDEWr
	5HiblN+rDw9dJKENTzWAp+BU8hDDahOKh96G7a5k5nYG9fRV9xqae6jwNRMDlwef
	pdOTfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx07mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 07:36:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131befso139133885a.0
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 23:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794641789; x=1795246589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=UKmz5q2mIvY3ox8YvLGiGLa4UUovJp3M15WUOYO2zgaNZ+WItOigAgV6RIqx6577TN
         +8dzi7RjiXGvgk+HWQKdq5F4YGhFOX9W9EKwM0Jb7m0gzCDKIc84p0S3VrNpztzJEljg
         wvz9VRpZkQ58qyYNLbG6nvFdZn3XxLRZ+vH5kVQie/2t5gBsF2k0QfYbPLyPz4Dw1QCl
         WybqKMjH5DpggzsGe4z+Uz+gbnwj8Aok8TRfRqAIbmSOFBJOohuTnco31YI6E5cKHFWy
         w+aNFQ9ikAmGNhqkxVgBbTSJQz1L1h925DlvEJAtbou78mZzQRilpFUe3BvmLMDIRMY7
         oFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794641789; x=1795246589;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7WGr88kqZVFkecXyL76q5SvjAL/wfEDOsv57Lh+q1es=;
        b=DSPgbdD59SHPmrMa+ppeUSjsSqIqJf7TC/FWjPJJB9GXJzuZB5jCq0shx8gELIv8ly
         J5NyPUDj7kRDWuft6B67QZ/SZYYnyHTij6SsPQEV04F6rvAEjQcqVweChNIJBYJ0Nhwq
         aJjGVBLFvFng62btwD/1xqVYnmMuSYncY0irGiC/fOtOt2AXcRY51CknQ3epZAJtsPi8
         uCcdAcLkMtmZzkwoiJ8gDBgaUSYE5ZvsDV/lAkjaJyQOJBBgFt5o1l24bsH9LXfFObXK
         C875dtywderXI3/hJSFBarcXvCxEA5z/ps5nfkLBDOyA0RForyChVI5mJF9G9df5F/ee
         D1Jw==
X-Forwarded-Encrypted: i=1; AL+hErHy1w/Ef/aDN5TzmNzXHbyw7M5iMCr5EN5+OMbT0zC1ItEQW5LH/vjDb5jUgsFP8EIcAfqUOlge3neC@vger.kernel.org
X-Gm-Message-State: APuU4Z/nq1y8nNIDNcB6ch4JmDuJneIdGS2PBYDzwzvw87fUgaw1e25d
	iyqhCjgD2mX5yLENjYUQ/BJekoyfAfFH72LO0xE3MckfbcNeh5dlavapPHbSHVmCF1tbbHrqSPn
	Wr0RHUN/soS4nU4Ie1P36Zno7J7whNnVCNkCk+HmPYj3K/3dfjOA7d+aJ+Xhh91gf
X-Gm-Gg: AYBFou1RvZCSUkaNYIs0PaJZnA5i0y4NxDG+oz3OXJ2qtOa5eMR468GQ4ZOVekL+0Oh
	5bQk//rt5rOjyfbMCFKeQykgpAmMsgAjxtOJD3h/cAzxKB9Y7TWh+JITHFhCtpGDcbUXcUj7VFB
	diPl5zoLdxdvCaikn84SQVxiAnlbLhfnegPF9+FDHQN4WdY8A+lLkkxV85JIfTtc4VlGu2FvKkT
	0zisVQkZXrKr4qGBwQ5SnpqbVSsxsHHknHMD9YbKFbq5YwbqCC5NSMKAjPBTbc5Wdb3DybaymuO
	BKSWGwdeUw3j46EMJdzXX2HXkIgEJ/npwQBGe5GRKoJSpU9amObg4D8b4zMQPkLfrJB15wCaS5A
	F7yKi4xThWGIZQvk7U2HyVVCJA1OMD+95vLDixXa/wBvtM/UQqvD5w11NbmURsJ0LF+z7jGtazx
	s=
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810227585a.46.1794641789520;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
X-Received: by 2002:a05:620a:2843:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-9494bc1b7d4mr810225585a.46.1794641789084;
        Fri, 13 Nov 2026 23:36:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm75459845e9.4.2026.11.13.23.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 23:36:28 -0800 (PST)
Message-ID: <246d5116-06b4-48aa-9805-b265005dc8cd@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:36:26 +0100
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
Subject: Re: [PATCH] arm64: dts: st: Correct white-space style in
 stm32mp2xxx-dhcos
To: Marek Vasut <marex@nabladev.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        devicetree@vger.kernel.org, kernel@dh-electronics.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261113185402.183367-2-krzysztof.kozlowski@oss.qualcomm.com>
 <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cfc503c-8da2-478b-bf5e-c4dc87bbb2d3@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfX9iq8yECv8+Fa
 TYleb0FgD+OYmgoFNDsxKzh9sX4F5KHKQrqDUxgInL0dwkAS8a4GRe+8W7PhJbOfSJ3UzFbutjb
 ZnAHkcvPrjbnclSZ4skAvP211TM5C7bpVcvuF2AKO0vElokcirw5IejgRPJRsMAsRashFnTPA/q
 GLH6w6aodruS4k37D/BJzwzX3F1YtUsUWHxUUZ4iy322pis6c5tXQpiBbt6+WHJ6TRA94wc+aFa
 OaUxvkd5QyjBLSKiC/5TXz11KTZq6nDmZLY92E1TI7UHWcyBbSFFd120yU4GnNkd73r6jSeo6eU
 bWT4bStyxan8f+W8QU6PbfRNglgn2d+nh+3pNNfkAdEsOABmHUPw08I9+s1F9vMkC1s3UXiPrbH
 sVYZMx1/6aca2FqOIyooWmQblMgjSZEMLPSxubdzZM0CXL6hdIXSIP2P0SShcgoOdQ3e12H63Z2
 BksUvklb25MCShUUzKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMCBTYWx0ZWRfX+vxlXnx7I4V1
 blR21ia15syq+DhnVvCk+6bZQZEGBwCPQdCjU28eu5vEW43CAbrMZWk9JDTS05LJtFf/rQYwywI
 KJP/3ZmXUH3EMeu0jiz/Bqc9PzbMWuU=
X-Proofpoint-ORIG-GUID: cm2WxmHmeZx__LUwY8Zr1yRaI0ywkEO9
X-Proofpoint-GUID: cm2WxmHmeZx__LUwY8Zr1yRaI0ywkEO9
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6af80f7e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p-LfKV-GAAAA:8 a=hS7FZtYCIGGB5UC-1UYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=97BuGM4RKn6GwmfqMd6i:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140030

On 14/11/2026 00:34, Marek Vasut wrote:
> On 11/13/26 7:54 PM, Krzysztof Kozlowski wrote:
>> Correct minor style issue around white-space - missing space.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Marek Vasut <marex@nabladev.com>
> 

Thanks

> I hope ST can pick up the various fixes for 7.4 .

White space should not be a fix...

Best regards,
Krzysztof
