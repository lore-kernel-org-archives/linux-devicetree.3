Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169045;
	b=Y82+A19g/gZeG14zId3yuirfhuGx2+QeL4d5IfR8nUEqCCRjhZYsvzKxJysT3sYOWaQ+
	 amW6SeQb3k6stlkIEwqXvKO4Y/P81Jpg5W9znccO80V1NBrK3GbhDjbvBIxwwdk9SbbgN
	 9W0mq6TxYYgojC1FSwIU+s29xcXF4jU8UwhfBqd8ESV11jS/SRvk2QubatyROmn2vUpeY
	 IZD2rwOhmjbTeY5i0MeQYF0mgS3LVfmRgbkqLbWCNJfaCIEAX4wbIFu06qR0T9mleKb7Z
	 6EdHwGcaCJUxcVx1lFcqTip4S4BP33faHHxo8G0MB0k6c+d5DFg2Gptrlzu9EyoPnpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
	b=Oy6hnZ3hTDB5i797brc6TQlkY//gBqa7BEMv/pdHuNI0Mn9oI7AroSZ7uF/h8iHpgijF
	 APYevT55AbGNGXycWwyzVVmg7NkaO+Fe2kvQcjGPbdAYLcM9hCRBjkuDy/pxPHPDUIYPe
	 NzPt0+PQnWmzWohCGWbol8foV8CVhTnFO5gbvewovGTJQwChL5qW0jd7fQgd1vqbQTamy
	 2rvo3Mr/484eS5GFliU+qXilxSw8wcg9idyBM5uBeJoRs5p/LRusDZuGQJMxv/7GLEEpO
	 LvQ5hBdCgxBQNVs8NJGdHDZyE05uX7Z6RtIaUkNc6dhUE4Pf4rDYwLr9bWXFkj6K9ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5F6606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5F6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XVGSAI2Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHj2y3RU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7frcI2695570
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXNcxzw/XZ79aNJphecWCC2a
	iJVKnB4p3dOXUqbKOGM=; b=XVGSAI2Y9lu0xVYuUhtuwNE5yFeCuOpjrfxDpGQR
	Jr0yb/LpmIbzacgKDnFDaUoWzehuySC/rOqdRv7EFCTUguJ0K/KpTp1cOnPQYo+W
	4IyQjZ27SvSDfAi4EqprlOZW2Un6M4hwrt9qG9QGC+10wRSGeLIs0SEx+eKwCvxF
	yf32JVCWbvhPAdxPj16V/QeLqzEwNAHARx1VkIQBaCRGaMhr3o1L28et2yrp4tLH
	QdMAGsFCSW2VskIVolgZi6m8w/nKPDGWlqT7+ZaIu6mN8goNpcrFSdlojQuwMWtB
	p9rGR7mQZMiacyK6Mw7gKceeAgzvpkNsyWzBcf5TZbxR0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3495-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:04:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so80610785a.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169043; x=1795773843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=jHj2y3RUqKEBd4XmzlMHklAh2e8sXGEG5i/dGI2P8aKJr8Rd7JmsUuQtPfG+Ot7PZx
         Erks4KA36xRu+wmF8oSKK2xc90AnNpklbaxsjpl1bow0dTusgOtT2cFsX/m1bYCZtdPM
         qZsAzj+pnHaiDKZ4zUbDhJSyBA9ZeFw1XIKEWoO9bilxXlOJa1Q1wJYuYWnyAQdULRba
         KE924JnA2yY8bkvO1J3gzGVNKvQQhzkW/q8aQJR0NZZ5CLMfp7bQHXYvoafoitQTH1Ia
         jLYlvJk3nkB9muwoqBKNN+pFqCm4Ytaz3p0IJytLKbXi7nZ3hAu3slY6fMDVAT9fqwYZ
         TOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169043; x=1795773843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PXNcxzw/XZ79aNJphecWCC2aiJVKnB4p3dOXUqbKOGM=;
        b=WBrcUbWt6mh4L1NmVEIfzAXBlCX/q7kt3NJ1fO7qYtp36U0uOJn6XO4HZDLfJ9mxer
         RAOQsnBnqP8NTZRUoEGVXxzyY4znzMvdJCcF8ube5NKLFdUXw4SYSJj32uqtWRghGtnc
         ULHS69AJJ27Ei5DvIWDxhcGpMk8M/ASOcRrFbAGGPWPWjThvsryMBJO8SVZZic4jJXW7
         hUZrDnw+zcplRut+yh+7tfKl3j6fvD+RKcV4/P3rMpFYwiMvT0k4NJCAnnokRJM1ptM2
         +5I6WcDs93BOAkfcYTlgW4fTpDu1wGG1YMBLZAusUJhitR3N1UGNqW+Tgr3anFRg38Rb
         nYaQ==
X-Forwarded-Encrypted: i=1; AL+hErGjxogi6fx0jHU18WJDB5V0D92jo+ImqJhIV4DauCVM1Fjzpo0d6OgKu0uZe0uFaVvXcEDJbf55DLnS@vger.kernel.org
X-Gm-Message-State: APuU4Z86KcJ0Q5ld0CXnbajHVWFkKE10LBURIDZipFwYttyZkID7Os3S
	ntexP7yJGytEnAfkj+VBOxYVFb9bkfS7V/DSofqV7FYQ4cU+lU9ly2az68dGJmlrZXdYtmkYhrt
	9GBpqYbfsbbqxVlhL1qx/YWjqRwcRMOtVDMHilqk2z52bBRsY8goH0S4/ftFWF5/6
X-Gm-Gg: AYBFou3Q8i4UsrnVpxsdsgJQWynW1lUARML9jQ0lc/zShuxDljIidkXy3TKY2pVuE7h
	oA3xvNCcSYwCTt7Ea7WG+MbSkiiAWDv+QK9ZgkOo/pjYUlxECryrOrLzrUqHSHCLRlh2LKDeYdz
	2uwdRw79ZBqtz+N6s66PM7gpw43SG+M7+hOMFkUOX62HJcflm0yM5N2vehCPj2AQYzPw/0Tidgl
	t/p420OHZGYh2gEQyIOohJDH9uBtVbtmOk9QxP7A2AG7Ng7cD5+3l8HElOnCoIV2Phk9g7nMyqy
	+h5WNyUq8Jhqnh3X1nzh1t5VhHIdwPpNoR08E2nchOS8YmrrGYIWGPhQg3Zz3AAY4vdYJjqe/H8
	4A/BRe/yqN1/5iF0cvIqenyViqMlQfwOOyhCxFAT8czlUzr95DBf6irSsv3cpfLgw
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51905085a.56.1795169043213;
        Fri, 20 Nov 2026 02:04:03 -0800 (PST)
X-Received: by 2002:a05:620a:2401:10b0:949:c503:ce40 with SMTP id af79cd13be357-949c503d18cmr51901785a.56.1795169042588;
        Fri, 20 Nov 2026 02:04:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm107120085e9.15.2026.11.20.02.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:01 -0800 (PST)
Date: Fri, 20 Nov 2026 12:03:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/11] soc: qcom: pd-mapper: Add support for Molokai
Message-ID: <prbf6six5jwxdyz6nz2qvtvgbmrpo3wgalzxxskq6542mi7aea@fxd2xclmjgwp>
References: <20261116-molokai-soc-v2-0-9dc4dddc4e96@yahoo.com>
 <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-molokai-soc-v2-5-9dc4dddc4e96@yahoo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX493twCTa8Ryc
 wlbyCvikh2p2ZC3Gn4EA0JllVZYl03f+c25BZ+R2AkYUIVBKGnvXdpMyzbAhKS5VRhcIjY7dUnj
 kKcu2Hqyb/pqlOsdoWZ2j/bmPMnTmvQp+JRrOH9ajRTZu1+vpGiL7uNxHO69yJzbcxTS/Z/dWzs
 N9i1n0dmcEOvvSFWOND/Gb4DUBHHY+woRFf3bkBKKXdoUT+zUZYWP0M2DORslH43E38+9GZGkl1
 BQH9VIYF43Qps5b+0sUOGOKk+Obc9qUB8BadTxfWom0BYCcBiPsZjMAp4biKwrYAygRZ5GWZZ9L
 EUH9Nzu3SuOlaZ//A7ZETNfBb8rGdCEz0Bg0aHdjUTHF4IIZKm+N53vApxYfIDe1xSGWlZODO+r
 lyeDXpDBNXd744qdbyLVohG3mV4DiCH+aId0HN72Q510olQS/dQ0wQF5zthHtABWVcrtUE2zOqc
 X3xAmXbrmoj8JQy2fNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzOSBTYWx0ZWRfX2cB268KImHao
 ag/WfM8DM5liMIprbZMDMoH5MON6uGEmHfykO6c/C0FyAtkQcOLZ38H9NgqY8jvtLBNO+DhNkmD
 KfaiKvLKZ0+tO+URqleA8ctxcmMg4B0=
X-Proofpoint-ORIG-GUID: Ju-9KTLLdH2w0LgfJDi2D5Nwa_ExIVMW
X-Proofpoint-GUID: Ju-9KTLLdH2w0LgfJDi2D5Nwa_ExIVMW
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b001b14 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=1uJLEA4eyktsYfoyBTQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200039

On 26-11-16 13:10:03, Venkat Yadlapati wrote:
> Molokai (SM8845) has the same remoteproc protection domains as Kaanapali.
> 
> An LLM was used to help write this commit message.

So a single line was written by LLM and then another line tells us that.

IMO, the second line is should be dropped.
