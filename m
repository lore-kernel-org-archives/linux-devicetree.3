Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093D3447819
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045353; cv=none; b=CyhK63cFvmG5ybhDoPmlRX6b61sgu/wMNVp3AbCZuIIE4jtfQAFUmnfIL1aXafjh+1JR1TiLDzhleRQHkPyGoMHmAVqHyqivthyO7bvvdI6/wAFxWA9+edUtL7SLQyAMbOTG77jgEh0tl9KGvsoLNuqi8xon9VVz4vQ0w9zlPbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045353; c=relaxed/simple;
	bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cXkUUFfK0zaYqDBP++sFMPQ8UGxS71+XYMp//uestA65Xc9cduLPFTck6T3HrpKuLB70y2auLRIgwsYNBQ//3wLy5t6bJnlT/CABGxt4mMijvrpc2GWhf0sDOUS9qOUn6sGUVN8JSPc7epbZjGtElRSIAbsIOLYnVe6zM7Lr61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd73Ry1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2v4Ggcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd73Ry1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2v4Ggcb"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BJLn325457
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=; b=Nd73Ry1qzGhkKemy
	JQ8GbMEFS7NX8kt4aXHxqxjYMwrRQcmkWP0Sp/3aTqeQD2Kxq6yM7Ns6GJ84SQBH
	6RGeMlJeSXuQx7BandcSjh6LiyH5lRNqY48DRNYAYP0pS7/7FghN02p+gnvN2mZ3
	T6rS5R32oIf8s6NzQUHybRvMzh9LJkyUljVIJS8/jiZuFqjmTwJiem5VelDPqvtI
	6eaD5xXBqJeqFZKXrC4ozHUjo9CEgKk59hLiwbjPEPJu1H8tBSicORTlRrCR4Q9v
	h/xZTcAxtvYZ7Nbn8Syo12/gwljg7EtqhJp7VbmUZSR/CQZXKNaTS8ks302NyuxJ
	Giou3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtsma8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:29:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so859161cf.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045350; x=1787650150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
        b=a2v4GgcbkUtWxne2a1MN5U6gWn5yM9hDEOzjuvcbLDmDq6MtW3ry2+tBGOe/3OMuoS
         0Xs3v8amEe9kjL9OY023FQsOBcyQujAOpZ/adVahi0zcAnzrs7abUJX0luQYsZKOnWAn
         i4nOjrUH7fkwtuQe+PMjzMTyulwCnsp5UpOUW+IApVmRGbHveOgUjz+PdcWVuQb8OP6V
         4CXC4OkaCMmtgwhaJ8+AyJGnh6pLVTrb/qadYH3OcWO7EKF5Jha0NpqUWgLrcfuXy4mu
         mNJVmVwR/lpF0rgCsXmDHLIBfy3DEAbGThWSXNRmcC3iaWHcD0YHis42BBSSYd25lWg7
         9HqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045350; x=1787650150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xbg/Leo9JGEINIj0/0E6vLDK9IWjAmkq/rRuhYHL3f8=;
        b=YHrZoyVYrSyRPs/CHmMQOPDizPRwn8l0k+TPBcoeT3FQB8YgECSI6xYfzfdxV+2dNI
         B4xyzaba4zM9eqebwVFLUTjQo7uxWPDhxqL4o3N9UxWajJeUS0h47oTgLJXmjF9HaYRG
         xha67kxqn95JP4P3WP+myMdQSsrEeTDIh9KdDyT0ZzJH0ZRD6VvhP9JLMbpNaLHV6MhS
         Jo+q5C9kes4FTOdOFpAkDBAr9lbKa3Y0xS5ksT9plt9S/tz9NyvCKzls/f1uE09LIHml
         ujs9i90p+qQl/qK+05wb7u/p66TCx+Ly+yjk2JmLOEKPlI/DlsJONHbpl9K4KXhxIhP3
         /H2A==
X-Forwarded-Encrypted: i=1; AHgh+RpDcNNHLAMIWoBuzhlm3ZLnZPjfLn8VGKNV7osvcCFJ/wM0+RmVJFGzomwCcj0gDo3Cqzc3SsXRLb1Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxnLS8bHhZbrgd2a6ID1EgKAMLv1rd2PNUUUSjzCSmvvb3Qs/Bh
	uAlokE2xPorD0gu91gHqCAMo70zbiKS/IPsyMKeQ7TT1gkoRLZh6YsM3vm9IA2lNWGNpDWzBtLE
	wx76y1T1FsnIalqUiRwnsEi3uNlzo6msFZYr7Jss0fTmfOgQ3DavT/LYNH9b/BC7I
X-Gm-Gg: AR+sD135RXM0RCSc68IYux4jjzKXOWM4VCFGPQopTNENlG6Ljqaa69EDbjA8deZGaFI
	hs66AhjxKTE82rs0WW4hyW5imbH7w8F5G8MyEpENIvJHBjAaIB0YduYQiMdakTb4YdU2suTLb6x
	5hnqGfyIEkEp6ZsWW/kMD7vv/B9As1ynuTZmtVFl03QbXAel/i9UcFUZc5DnZsi6Uemoon8RNHn
	w7rBSRdnU7+H1WjlnBkBqp1rtkoAOpo6LDMQ6SU3qkrhMviRHjzaCo4sJmNCANg+poGQ0yqkika
	4P+Ji7K7xezHo6lnB/+2norNT/gGSrb5xe6liNylIR5sPn3rmkbcsLIjoDSIdAG83toKavwUxm5
	LRzxiuN5/ieognK5V7qX6rPMk
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr243806851cf.2.1787045350324;
        Tue, 18 Aug 2026 02:29:10 -0700 (PDT)
X-Received: by 2002:a05:622a:c2:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-52d852f49f4mr243806751cf.2.1787045349958;
        Tue, 18 Aug 2026 02:29:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8530d3bsm1694606a12.10.2026.08.18.02.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:29:08 -0700 (PDT)
Message-ID: <642652c2-af5d-446c-ac1a-8099639c2588@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:29:06 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: use polling mode for SCMI
 transfers
To: Jesse Casco <jesse.casco@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260808172211.137577-1-jesse.casco@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808172211.137577-1-jesse.casco@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX+CZC5R/5aJqe
 S1N5ojAulcvzfduwFHKBGylRJHFu8RcznJKLb68GiuM9Pid3mbrG0bW7GmzSaETTmQtX4d10rx3
 87cRG08KrewYhAd0a5hpChJN6neZtrs=
X-Proofpoint-ORIG-GUID: ItMFLxXpho0g5Y1TFcvoNyw81hTZUs1w
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a8425e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Yvg1zlJodvQbsUTSnWkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ItMFLxXpho0g5Y1TFcvoNyw81hTZUs1w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX8EMfE5kXvrW/
 mhLO8QPdTrXQbIG9IX6YUpQY4lo99wqjsrTLAjYBcqEGZO5hN3xMOZPaapHtJmw5VcROO5P5R89
 kkSCqLTKCY88mdVdsKa4MVh05SS0m2+HLkN8JYEsEv6NsKPecdFBJcgR/Tj9NSFieXXmcKnLx7n
 YX6rOrut0cVh3XJ1PVogbGcFf7TWP/+wZBjZ/7eisK6nZxzXkB/hv4jlvk03z6Zuoqx0PQIRfN0
 J9pW9IdB3nu1b1u+/PBI/IbNR3cpq1Sd/E/o1bIRthXBHaYdIX+hIByUGQTbiX7Ig7nuSmMCynZ
 jIyvOc4wVW7gAn7T+VgUAGIUCm7rqThd6zyczwb72AaDMuFV0ow8WUz/Dm7+YIvmt3yI8s6hsAB
 vz1DGvEJgzYNfKMu1eKv4NMJkOEX7l1Cicp59P8o8nkuAm5Q3EJbNEwYv4vVbjZSPA24RbSgI7S
 eajJkFaF8Ous6F/xYRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180069

On 8/8/26 7:22 PM, Jesse Casco wrote:
> On glymur the CPUCP firmware writes correct SCMI replies into the shared
> memory but never rings the mailbox doorbell for them. Every transfer that
> waits for the completion interrupt therefore times out, scmi-cpufreq
> fails to probe with -110, and the machine ends up with no cpufreq at all
> -- all CPUs pinned at their boot OPP.

I'm not seeing this issue, but I heard others hit it, possibly due to some
timing bug. If you set your kernel config to build all drivers in (i.e.
change =m to =y), do you still face this?

Konrad
